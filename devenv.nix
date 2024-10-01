{
  languages = {
    elixir.enable = true;
    erlang.enable = true;
    nix.enable = true;
    shell.enable = true;
  };
  devcontainer.enable = true;
  difftastic.enable = true;
  pre-commit.hooks = {
    actionlint.enable = true;
    markdownlint.enable = true;
    nixpkgs-fmt.enable = true;
    shellcheck.enable = true;
    shfmt.enable = true;
    statix.enable = true;
  };
}
