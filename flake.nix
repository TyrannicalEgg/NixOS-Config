{
  description = "NixOS configuration";

  inputs = {
    nixpkgs = {
      type = "github";
      owner = "NixOS";
      repo = "nixpkgs";
      ref = "nixos-unstable";
    };

    nixos-hardware = {
      type = "github";
      owner = "NixOS";
      repo = "nixos-hardware";
    };

    home-manager = {
      type = "github";
      owner = "nix-community";
      repo = "home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }: {
    nixosConfigurations = let
      hosts = [ 
        "desktop"
        "laptop"
        "legion"
        "nixos"
        "ttb550m"
      ];

      mkHostConfig = host: {
        ${host} = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [ 
            ./hosts/${host}
            { networking.hostName = "${host}"; }
          ];
        };
      };
    in builtins.foldl' (configs: host: configs // mkHostConfig "${host}") {} hosts;

    homeConfigurations = let
      users = [
        "ash"
        "valentin"
        "vulpes"
      ];
      mkUserConfig = user: {
        ${user} = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          modules = [ ./users/${user} ];
        };
      };
    in builtins.foldl' (configs: user: configs // mkUserConfig "${user}") {} users;
  };
}
