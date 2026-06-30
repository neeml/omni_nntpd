{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    systems.url = "github:nix-systems/triplet";
    devenv = {
      url = "github:cachix/devenv";
      inputs.nixpkgs.follows = "nixpkgs";

      inputs.flake-compat.follows = "flake-compat";
    };
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
  };

  nixConfig = {
    extra-trusted-public-keys = "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=";
    extra-substituters = "https://devenv.cachix.org";
  };

  outputs = inputs: let
    inherit (inputs) self devenv nixpkgs;

    forEachSystem = let
      systems = import inputs.systems;
      genPkgs = system: nixpkgs.legacyPackages.${system};
      inherit (nixpkgs.lib) genAttrs;
    in
      f: genAttrs systems (system: f (genPkgs system));
  in {
    packages = forEachSystem (pkgs: let
      inherit (pkgs) beamPackages lib;
      inherit (pkgs.stdenv.hostPlatform) system;
    in {
      omni-nntpd = beamPackages.mixRelease rec {
        pname = "omni_nntpd";
        version = "0.1.0";
        src = self;

        mixFodDeps = beamPackages.fetchMixDeps {
          inherit pname src version;

          hash = "sha256-QY06XB1KLC1JSyTmmZ11goL2FZUxLtc1rOqs99f8iH0=";
        };

        passthru = {
          inherit mixFodDeps;

          elixirPackage = beamPackages.elixir;

          updateScript = pkgs.nix-update-script {};
        };
      };
      default = self.packages.${system}.omni-nntpd;
      docker = let
        entrypoint = pkgs.writeShellScript "entrypoint" ''
          /bin/omni_nntpd eval "OmniNNTPd.Release.migrate"
          /bin/omni_nntpd start
        '';
      in
        pkgs.dockerTools.buildLayeredImage {
          config.Cmd = ["./${entrypoint}"];
          contents = with self.packages.${system}; [omni-nntpd];
          name = "ghcr.io/neeml/omni_nntpd";
          tag = "latest";
        };
    });

    devShells.default = forEachSystem (pkgs:
      devenv.lib.mkShell {
        inherit inputs pkgs;
        modules = [
          ({pkgs, ...}: {
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
          })
        ];
      });

    apps = forEachSystem (pkgs: let
      inherit (pkgs.stdenv.hostPlatform) system;
    in {
      docker = let
        drv = self.packages.${system}.docker;
      in {
        type = "app";
        inherit drv;
      };
      default = let
        drv = self.packages.${system}.default;
      in {
        type = "app";
        inherit drv;
      };
    });
  };
}
