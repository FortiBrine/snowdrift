{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };

  outputs = { self, nixpkgs, ... }:
    let
      mkHost = fileName:
        let name = nixpkgs.lib.removeSuffix ".nix" fileName;
        in nixpkgs.lib.nameValuePair name (nixpkgs.lib.nixosSystem {
          modules = [
            ./configuration.nix
            ./hosts/${fileName}
          ];
        });
    in {
      nixosConfigurations = builtins.listToAttrs (
        map mkHost (builtins.attrNames (builtins.readDir ./hosts))
      );
    };
}
