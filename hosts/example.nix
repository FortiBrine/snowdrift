{ networking.hostName = "hostname";
  my = {
    net = {
      interface = "ens3";
      ipv4      = "0.0.0.0";
      ipv6      = "::1";
      gateway   = "0.0.0.0";
      gateway6  = "::1";
    };
    users.sshKeys = [
      "ssh-ed25519 AAAA... user@host"
    ];
  };
}
