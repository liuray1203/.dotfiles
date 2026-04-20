{
  description = "NixOS + Home Manager modular setup";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    stylix.url = "github:danth/stylix";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, stylix, ... }@inputs:
  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = { inherit self inputs; };

      modules = [
        # 系統層通用設定
        ({ ... }: {
          nixpkgs.config.allowUnfree = true;
        })

        # 系統模塊：負責 SDDM + 安裝 Hyprland/Waybar/Kitty
        ./modules/system/display.nix

        # 系統主配置
        ./configuration.nix

	# 字體配置
	./modules/system/fonts.nix

        # Home Manager
        home-manager.nixosModules.home-manager

        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          # 用戶層 Home Manager 設定（模塊化）
          home-manager.users."liuray" = import ./home/liuray.nix;
        }
      ];
    };
  };
}

