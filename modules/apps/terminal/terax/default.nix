{ config, pkgs, ... , inputs ? {} }:

{
  # 把 terax 加到該使用者的 home.packages
  home.packages = [
    inputs.terax.packages.${pkgs.system}.terax
  ];
}
