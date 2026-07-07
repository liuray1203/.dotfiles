{ inputs, pkgs, ... }:

{
  home.packages = [
    inputs.terax.packages.${pkgs.system}.terax
  ];
}
