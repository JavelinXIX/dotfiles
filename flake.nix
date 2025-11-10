{
    description = "NixOS";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager";
	home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };
        
    outputs = { self, nixpkgs, home-manager, ... }: {
         nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                /home/tomoya-f/dotfiles/nixos/configuration.nix
	        home-manager.nixosModules.home-manager {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
	    	    home-manager.users.tomoya-f = import ./home-manager/home.nix;
	    	}
            ];
        };
    };
}
