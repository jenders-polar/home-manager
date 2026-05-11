{ pkgs, ... }:
let
  nixvim = import (fetchGit {
    url = "https://github.com/nix-community/nixvim";
  });
in
{
  imports = [
    nixvim.homeModules.nixvim
		./programs/nixvim.nix
  ];
  home.username = "jenders";
  home.homeDirectory = "/home/jenders";
  home.stateVersion = "23.11";

  home.packages = [
    pkgs.btop
  ];

  home.file = {};

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
