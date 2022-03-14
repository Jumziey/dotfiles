# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  nixpkgs.config.allowUnfree = true;
  imports =
    [
      ./hardware-configuration.nix
      ./nvim/default.nix
    ];


  nix = {
    extraOptions = ''
      extra-experimental-features = nix-command
      extra-experimental-features = flakes
    '';
  };

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
      configFile = ./configs/i3/config;
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
    initialPassword = "test";
  };

  environment.systemPackages = with pkgs; [
    lightdm
    # awscli2
    #python38Packages.cfn-lint
    git
    nix-index
    dhcpcd
    bash
    parallel
    alacritty
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
    fzf
    nix-prefetch-git
    awscli2
    jdt-language-server
    yarn
    nodePackages.lerna
    terraform
    cucumber
    openjdk11
    maven
    wget
    curl
    unzip
    k9s
    minikube
    direnv
    zsh-nix-shell
  ];
  services.prometheus.exporters.node = {
    port = 9100;
    enable = true;
    openFirewall = true;
  };

  services.blueman.enable = true;

  programs = {
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

  environment.variables = {
    MOZ_USE_XINPUT2 = "1";
    PATH = [
      "\${HOME}/bin"
      "."
      "\${HOME}/.local/bin"
    ];
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;

    interactiveShellInit = ''
      source ${pkgs.zsh-nix-shell}/share/zsh-nix-shell/nix-shell.plugin.zsh
    '';

    shellInit = ''
      eval "$(direnv hook zsh)"

      SAVEHIST=1000
      setopt appendhistory notify
      unsetopt autocd beep extendedglob nomatch
      bindkey -v
      bindkey -a s vi-forward-char
      bindkey -a t down-history
      bindkey -a n up-history
    '';

    # source ${pkgs.spaceship-prompt}/share/zsh/site-functions/prompt_spaceship_setup
    promptInit = ''
        autoload -U promptinit; promptinit
        prompt spaceship
        spaceship_nix_shell() {
          name="''${name%-shell-env}"
          name="''${name%-shell}"
          name="''${name%shell}"

          if [ ! -z ''${name} ]; then
            prefix="$name"
          fi
          if [ ! -z ''${NIX_SHELL_PACKAGES} ];then
            prefix="''${prefix}($NIX_SHELL_PACKAGES)"
          fi
          if [ ! -z ''${prefix} ];then
            spaceship::section "red" "" "$prefix " ""
          fi
        }
      SPACESHIP_PROMPT_ORDER=(nix_shell $SPACESHIP_PROMPT_ORDER )
    '';
    setOptions = [
      "append_history"
      "hist_ignore_dups"
      "hist_ignore_space"
    ];


    shellAliases = {
      getfont = "fc-list | cut -d ':' -f  2 | sort | fzf | xargs | tee >(xclip -selection primary&) >(xclip -selection clipboard&)";

      printrun = "docker run --device /dev/ttyACM0 -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $PWD:/root twhtanghk/docker.printrun";

      printrunACM1 = "docker run - -device /dev/ttyACM1 - e DISPLAY - v /tmp/.X11-unix:/tmp/.X11-unix -v $PWD:/root twhtanghk/docker.printrun";

      xcl = "tr -d [:space:] | xclip -selection clipboard";
      cppwd = ''echo -n "cd $(pwd | tr -d [:space:])" | xclip -selection clipboard'';
      sudo = "sudo -E";
      portcheck = "netstat -ltnp";
      ls = "ls --color";
    };
  };

  nixpkgs.overlays = [
    (final: prev: {
      discord = prev.discord.override rec {
        version = "0.0.17";
        src = prev.fetchurl {
          url = "https://dl.discordapp.net/apps/linux/${version}/discord-${version}.tar.gz";
          sha256 = "058k0cmbm4y572jqw83bayb2zzl2fw2aaz0zj1gvg6sxblp76qil";
        };
      };
    })
  ];
}
