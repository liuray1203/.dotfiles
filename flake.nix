{
  description = "NixOS + Home Manager modular setup";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags.url = "github:aylur/ags/v1";

    terax.url = "github:crynta/terax-ai";
  };

  outputs = {
    self,
    nixpkgs, 
    home-manager, 
    stylix, 
    sops-nix, 
    ags,
    ... 
    }
    @inputs:

  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit self inputs; };
      modules = [
        ({ ... }: { nixpkgs.config.allowUnfree = true; })
        ./configuration.nix
        stylix.nixosModules.stylix
        sops-nix.nixosModules.sops
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs   = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit inputs; };
          home-manager.users."liuray"  = import ./home/liuray.nix;
        }
      ];
    };
  };
}
