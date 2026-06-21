{ config, lib, pkgs, ... }: {
  options.my.users.sshKeys = lib.mkOption {
    type = lib.types.listOf lib.types.str;
    default = [];
  };

  config.users.users.fortibrine = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = config.my.users.sshKeys;
  };
}
