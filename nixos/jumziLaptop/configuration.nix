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

  nix ={
    package = pkgs.nixFlakes;
    extraOptions = ''
    extra-experimental-features = nix-command flakes
    '';
  };

  # boot loader, might go to grub laters
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "jumziLaptop"; # Define your hostname.
  networking.networkmanager.enable = true;
  networking.networkmanager.dhcp = "dhcpcd";
  networking.useDHCP = false;
  networking.nameservers = [ "192.168.1.1" ];

  networking.extraHosts =
    ''
      192.168.1.1 router
      192.168.0.1 jumziServer
      192.168.0.201 node-1
      192.168.0.202 node-2
      192.168.0.203 node-3
    '';

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

  # This is required so that pod can reach the API server (running on port 6443 by default)
  networking.firewall.allowedTCPPorts = [ 6443 10250 ];
  services.k3s = {
    enable = true;
    role = "server";
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
    samsung-unified-linux-driver
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
        "libvirtd"
      ];
    shell = pkgs.zsh;
    initialPassword = "test";
  };

  users.extraGroups.vboxusers.members = [ "jumzi" ];

  environment.systemPackages = with pkgs; [
    lightdm
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
    deluge
    flameshot
    go
    google-chrome
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
    cucumber
    wget
    curl
    unzip
    k9s
    minikube
    zsh-nix-shell
    direnv
    virt-manager
    vagrant
    tdesktop
    kubeseal
    openssl
    postman
    terraform
    zathura
    dolphin-emu-beta
    git-lfs
  ];
  environment.pathsToLink = [
    "/share/nix-direnv"
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
    tmux = {
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

  virtualisation =
    {
      docker.enable = true;
      libvirtd.enable = true;
      virtualbox.host.enable = true;
    };
  environment.etc."vbox/networks.conf".text = ''
    * 192.168.5.0/8
    * 192.168.56.0/21
  '';

  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.rg/nixos/options.html).
  system.stateVersion = "22.05";

  services.sshd.enable = true;

  environment.variables = {
    MOZ_USE_XINPUT2 = "1";
    PATH = [
      "\${HOME}/bin"
      "\${HOME}/.local/bin"
      "\${HOME}/.go/bin"
    ];
    EDITOR = "nvim";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;

    interactiveShellInit = ''
      source ${pkgs.zsh-nix-shell}/share/zsh-nix-shell/nix-shell.plugin.zsh

      title() {
        echo -e "\033]0;''${1}\007"
      }

      recursive_replace() {
        command="find \"$PWD\" -type f -print0 | xargs -0 sed -i \"s/''${1}/''${2}/g\""
        echo "$command"
        eval "$command"
      }

      img() {
        viewnior "''$@"
      }

      play() {
        mpv "''$@" 
      }

      tar_compress() {
        tar -czvf "''${1}".tar.gz "''${1}"
      }

      lowercase() {
        echo "''${1}" | tr '[:upper:]' '[:lower:]'
      }

      json_escape () {
          python -c 'import json,sys;t=sys.stdin.read();print(json.dumps(t));' < $1 
      }

      vartype() {
          local var
          var=$( declare -p "$1" )
          local reg='^declare -n [^=]+=\"([^\"]+)\"$'
          while [[ $var =~ $reg ]]; do
                  var=$( declare -p "''${BASH_REMATCH[1]}" )
          done

          case "''${var#declare -}" in
          a*)
                  echo "ARRAY"
                  ;;
          A*)
                  echo "HASH"
                  ;;
          i*)
                  echo "INT"
                  ;;
          x*)
                  echo "EXPORT"
                  ;;
          *)
                  echo "OTHER"
                  ;;
          esac
      }
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
            spaceship::section "RED" "" "$prefix " ""
          fi
        }
      SPACESHIP_PROMPT_ORDER=(nix_shell $SPACESHIP_PROMPT_ORDER )
      SPACESHIP_KUBECTL_SHOW=true
      SPACESHIP_KUBECTL_VERSION_SHOW=false
      SPACESHIP_KUBECONTEXT_SHOW=true
    '';
    setOptions = [
      "append_history"
      "hist_ignore_dups"
      "hist_ignore_space"
    ];


    shellAliases = {
      listDesktopFiles = ''find / -iname "*desktop" -type f -not -path "/nix/store*" 2> /dev/null'';
      getfont = "fc-list | cut -d ':' -f  2 | sort | fzf | xargs | tee >(xclip -selection primary&) >(xclip -selection clipboard&)";

      printrun = "docker run --device /dev/ttyACM0 -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $PWD:/root twhtanghk/docker.printrun";

      printrunACM1 = "docker run - -device /dev/ttyACM1 - e DISPLAY - v /tmp/.X11-unix:/tmp/.X11-unix -v $PWD:/root twhtanghk/docker.printrun";

      xcl = "tr -d [:space:] | xclip -selection clipboard";
      cppwd = ''echo -n "cd $(pwd | tr -d [:space:])" | xclip -selection clipboard'';
      sudo = "sudo -E";
      portcheck = "netstat -ltnp";
      xclip = "xclip -selection clipboard";
      ls = "ls --color";
      open = "xdg-open";
    };
  };

  nixpkgs.overlays = [
    (final: prev: {
      discord = prev.discord.override rec {
        version = "0.0.21";
        src = prev.fetchurl {
          url = "https://dl.discordapp.net/apps/linux/${version}/discord-${version}.tar.gz";
          sha256 = "sha256-KDKUssPRrs/D10s5GhJ23hctatQmyqd27xS9nU7iNaM=";
        };
      };
    })
    (final: prev: {
      dolphin-emu-beta = prev.dolphin-emu-beta.overrideAttrs (finalAttrs: prevAttrs: {
        version = "5.0-17995";
        src = prev.fetchFromGitHub {
          owner = "dolphin-emu";
          repo = "dolphin";
          rev = "8bad821019721b9b72701b495da95656ace5fea5";
          sha256 = "sha256-uxHzn+tXRBr11OPpZ4ELBw7DTJH4mnqUBOeyPlXNAh8=";
          fetchSubmodules = true;

        };
      cmakeFlags = [
        "-DDISTRIBUTOR=NixOS"
        "-DUSE_SHARED_ENET=ON"
        "-DDOLPHIN_WC_REVISION=${finalAttrs.src.rev}"
        "-DDOLPHIN_WC_DESCRIBE=${finalAttrs.version}"
        "-DDOLPHIN_WC_BRANCH=master"];
      });
    })
  ];
}


