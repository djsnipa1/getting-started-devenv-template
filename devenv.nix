{ pkgs, ... }:

{
  # https://devenv.sh/basics/
  env.GREET = "devenv";

  # https://devenv.sh/packages/
  packages = with pkgs; w[ 
    git
    neovim
    lf
    bat
    exa
    figlet
    lolcat
  ];

  enterShell = ''
    figlet hello | lolcat
    nvim --version
  '';

  # https://devenv.sh/languages/
  languages.nix.enable = true;

  # https://devenv.sh/scripts/
  scripts.hello.exec = "echo hello from $GREET";

  # https://devenv.sh/pre-commit-hooks/
  pre-commit.hooks = {
    shellcheck.enable = true;
    nixpkgs-fmt.enable = true;
    nix-linter.enable = true;
  };

  # https://devenv.sh/processes/
  # processes.ping.exec = "ping example.com";
}
