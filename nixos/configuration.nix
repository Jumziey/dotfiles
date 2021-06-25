# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  nixpkgs.config.allowUnfree = true;
  imports =
    [
      ./hardware-configuration.nix
    ];


  # boot loader, might go to grub laters
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "jumziLaptop"; # Define your hostname.
  networking.networkmanager.enable = true;
  networking.networkmanager.dhcp = "dhcpcd";
  networking.useDHCP = false;
  # Might need to move out, since it's specific


  time.timeZone = "Europe/Stockholm";


  i18n.defaultLocale = "en_US.UTF-8";

  console = {
    packages = [
      pkgs.terminus_font
    ];
    font = "ter-132n";
    earlySetup = true;
    # Important, and great!
    # making the x11 keyboard layout
    # work in the console
    useXkbConfig = true;
  };



  # Configure keymap in X11
  services.xserver = {
    enable = true;

    layout = "se";
    xkbVariant = "dvorak_a5";
    xkbOptions = "caps:swapescape, altwin:swap_lalt_lwin";

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3status
      ];
      package = pkgs.i3-gaps;
    };

    displayManager = {
      defaultSession = "none+i3";
      lightdm.enable = true;
      autoLogin.enable = true;
      autoLogin.user = "jumzi";
    };

  };


  services.printing.enable = true;
  services.printing.drivers = with pkgs; [
    gutenprint
    gutenprintBin
    samsungUnifiedLinuxDriver
    splix
    brlaser
    brgenml1lpr
    brgenml1cupswrapper
  ];

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  users.users.jumzi = {
    isNormalUser = true;
    extraGroups =
      [
        "wheel"
        "docker"
        "networkmanager"
      ];
    shell = pkgs.zsh;
    initialHashedPassword = "test";
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  environment.systemPackages = with pkgs; [
    lightdm
    awscli2
    python38Packages.cfn-lint
    git
    nix-index
    dhcpcd
    bash
    parallel
    kitty
    firefox
    feh
    htop
    ripgrep
    zsh
    curl
    nodejs
    zathura
    xclip
    docker
    docker-compose
    spaceship-prompt
    file
    shellcheck
    bats
    vim-vint
    slack
    discord
    pavucontrol
    blueman
    xbindkeys
    gnome3.adwaita-icon-theme
    pass
    gnupg
    pinentry
    pinentry-curses
    docker-credential-helpers
    kind
    kubectl
    mpv
    kubernetes-helm
    bitwarden
    discord
    deluge
    flameshot
    gopls
    go
    golangci-lint
    golint
    goimports
    chromium
    ngrok
    tmux
    jq
    irssi
    nodePackages.prettier
    nodePackages.eslint_d
    nixpkgs-fmt
    python3
    yamllint
    gcc
    prometheus-node-exporter
    tree
    rclone
    graphviz
    texlive.combined.scheme-full
    neovim
  ];
  services.prometheus.exporters.node = {
    port = 9100;
    enable = true;
    openFirewall = true;
  };

  services.blueman.enable = true;

  programs = {
    zsh.enable = true;
    steam.enable = true;
    nm-applet.enable = true;
    dconf.enable = true;
    gnupg.agent.enable = true;
  };

  programs.tmux = {
    enable = true;
    shortcut = "a";
    aggressiveResize = true;
    baseIndex = 1;
    newSession = true;
    # Stop tmux+escape craziness.
    escapeTime = 0;

    extraConfig = ''
      set -g status off
    '';
  };

  fonts = {
    fonts = with pkgs; [
      (nerdfonts.override { fonts = [ "Terminus" "Ubuntu" "JetBrainsMono" ]; })
    ];

    fontconfig = {
      defaultFonts = {
        serif = [ "JetBrainsMono" ];
        sansSerif = [ "JetBrainsMono" ];
        monospace = [ "JetBrainsMono" ];
      };
    };
  };

  virtualisation.docker.enable = true;

  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09";

  services.sshd.enable = true;

  nixpkgs.overlays = [
    (self: super: {
      neovim = super.neovim.override {
        viAlias = true;
        vimAlias = true;
        withNodeJs = true;
      };
    })
    (self: super: {
      discord = super.discord.override rec {
        version = "0.0.15";
        src = super.fetchurl {
          url = "https://dl.discordapp.net/apps/linux/${version}/discord-${version}.tar.gz";
          sha256 = "adede954e9c696d96e254759b539527a24ab1d42f0d548c5c4309d1a3fc3c25e";
        };
      };
    })
  ];
}
