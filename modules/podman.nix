{ pkgs, ... }: {
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    defaultNetwork.settings.dns_enabled = true;
  };
  systemd.user.sockets.podman.wantedBy = [ "sockets.target" ];

}

