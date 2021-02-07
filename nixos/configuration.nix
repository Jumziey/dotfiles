# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "jumziLaptop"; # Define your hostname.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "Europe/Stockholm";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.wlp0s20f3.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    packages = [
      pkgs.terminus_font
    ];
   # font = "Lat2-Terminus16";
    font = "ter-132n";
    # keyMap = "dvorak-sv-a5";
    earlySetup = true;
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
        dmenu #application launcher most people use
        i3status # gives you the default i3 status bar
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
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jumzi = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
		lightdm
    git
    neovim
    nix-index
    bash
    parallel
    kitty
    firefox
    feh
    htop
    ripgrep
    zsh
    curl
    python38Packages.pynvim
    python37Packages.pynvim
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
  ];

  programs = {
    zsh.enable = true;
  };

	fonts = {
		fonts = with pkgs; [
			(nerdfonts.override { fonts = [ "Terminus" "Ubuntu" ]; })
		];

		fontconfig = {
			defaultFonts = {
				serif = [ "Ubuntu" ];
				sansSerif = [ "Ubuntu" ];
				monospace = [ "Terminus" ];
			};
		};
	};

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?

}

