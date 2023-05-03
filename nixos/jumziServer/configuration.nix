{ config, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nix ={
    package = pkgs.nixFlakes;
    extraOptions = ''
    extra-experimental-features = nix-command flakes
    '';
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
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

  services.xserver = {
    layout = "se";
    xkbVariant = "dvorak_a5";
    xkbOptions = "caps:swapescape, altwin:swap_lalt_lwin";
  };

  networking = {
    hostName = "jumziServer";
    defaultGateway = "192.168.1.1";
    nameservers = [ "1.1.1.1" "8.8.8.8" ];
    bridges = {
      virbr0 = {
        interfaces = [
          "eth0"
        ];
      };
    };
    interfaces.virbr0.ipv4 = {
      addresses = [{
        address = "192.168.0.1";
        prefixLength = 23;
      }];
      routes = [{
        address = "0.0.0.0";
        prefixLength = 0;
        via = "192.168.1.1";
      }];
    };
  };

  # Set your time zone.
  time.timeZone = "Europe/Stockholm";

  i18n.defaultLocale = "en_US.UTF-8";

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  users.users.jumzi = {
    isNormalUser = true;
    extraGroups = [ "wheel" "libvirtd" ]; # Enable ‘sudo’ for the user.
  };

  services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
    };
    onBoot = "start";
  };
  programs.dconf.enable = true;
  environment.systemPackages = with pkgs; [
    virt-manager
    tmux
  ];

}
