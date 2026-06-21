{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    vim
    btop
    fastfetch
    cpufetch
    speedtest-go
    nftables
    docker-compose
    docker-buildx
  ];

}
