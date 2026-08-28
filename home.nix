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
    ./programs/direnv.nix
    ./programs/lazydocker.nix
    ./programs/lazygit.nix
    ./programs/btop.nix
    ./programs/fish.nix
  ];

  home.username = "jenders";
  home.homeDirectory = "/home/jenders";
  home.stateVersion = "23.11";
  home.shell.enableFishIntegration = true;

  home.packages = [
    pkgs.devenv
    pkgs.nixfmt
    pkgs.nixfmt-tree
    pkgs.eza
    pkgs.ripgrep
  ];

  home.file = { };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
