{
    description = "NixOS";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
        home-manager.url = "github:nix-community/home-manager/release-24.05";
	home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };
        
    outputs = { self, nixpkgs, home-manager, ... }: {
         nixosConfigurations.NixOS = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                ./nixos/configuration.nix
	        home-manager.nixosModules.home-manager {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
	    	    home-manager.users.tomoya-f = import ./home-manager/home.nix;
	    	}
            ];
        };
    };
}
