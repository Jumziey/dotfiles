# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
      ./nvidia.nix
    ];

  hardware.bluetooth.enable = true;

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    {
      device = "/dev/mapper/crypted";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."crypted".device = "/dev/disk/by-uuid/cbcea096-8ebd-42de-9e6c-4a2448ad30f1";

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/604F-9950";
      fsType = "vfat";
    };

  swapDevices = [ ];


  services.xserver.dpi = 96;
  #environment.variables = {
  #  GDK_SCALE = "2";
  #  GDK_DPI_SCALE = "0.5";
  #  _JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
  #};

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  # high-resolution display
  hardware.video.hidpi.enable = lib.mkDefault true;

  services.xserver.libinput = {
    enable = true;
    touchpad = {
      accelProfile = "flat";
      disableWhileTyping = true;
      naturalScrolling = true;
      scrollMethod = "twofinger";
    };
  };
  environment.variables.XCURSOR_SIZE = "48";

  services.xserver.config = ''
    Section "InputClass"
      Identifier "DELL097E:00 04F3:311C Touchpad"
      MatchProduct "DELL097E:00 04F3:311C Touchpad"
      Option "TransformationMatrix" "2 0 0 0 2 0 0 0 1"
    EndSection
  '';

  services.logind.lidSwitch = "ignore";

}
