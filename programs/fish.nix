{ ... }: {
  programs.fish = {
    enable = true;
    shellAliases = {
      "ls" = "eza";
    };
  };
}
