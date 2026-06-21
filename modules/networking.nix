{ config, lib, ... }: {
  options.my.net = {
    interface = lib.mkOption { type = lib.types.str; };
    ipv4 = lib.mkOption { type = lib.types.str; };
    ipv4PrefixLength = lib.mkOption { type = lib.types.int; default = 32; };
    ipv6 = lib.mkOption { type = lib.types.str; };
    ipv6PrefixLength = lib.mkOption { type = lib.types.int; default = 64; };
    gateway = lib.mkOption { type = lib.types.str; };
    gateway6 = lib.mkOption { type = lib.types.str; };
    nameservers = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ "1.1.1.1" "1.0.0.1" ];
    };
  };

  config = {
    time.timeZone = "Europe/Warsaw";
    networking = {
      useDHCP = false;
      interfaces.${config.my.net.interface} = {
        useDHCP = false;
        ipv4.addresses = [{
          address = config.my.net.ipv4;
          prefixLength = config.my.net.ipv4PrefixLength;
        }];
        ipv6.addresses = [{
          address = config.my.net.ipv6;
          prefixLength = config.my.net.ipv6PrefixLength;
        }];
      };
      defaultGateway = {
        address = config.my.net.gateway;
        interface = config.my.net.interface;
      };
      defaultGateway6 = {
        address = config.my.net.gateway6;
        interface = config.my.net.interface;
      };
      nameservers = config.my.net.nameservers;
    };
  };
}
