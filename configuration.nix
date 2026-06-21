
{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/bundle.nix
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda"; # or "nodev" for efi only

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
 
  time.timeZone = "Europe/Warsaw";

  networking.firewall.allowedTCPPorts = [ 2222 ];
  networking.firewall.enable = true;

  system.stateVersion = "26.05"; # Did you read the comment?

}

