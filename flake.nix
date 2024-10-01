{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    devenv = {
      url = "github:cachix/devenv";
      inputs.nixpkgs.follows = "nixpkgs";
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

  outputs = { self, nixpkgs, devenv, ... } @ inputs:
    let
      forEachSystem = nixpkgs.lib.genAttrs [ "x86_64-linux" "aarch64-linux" ];
    in
    {
      packages = forEachSystem (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          entrypoint = pkgs.writeShellScript "entrypoint" ''
            /bin/omni_nntpd eval "OmniNNTPd.Release.migrate"
            /bin/omni_nntpd start
          '';
          inherit (pkgs) beamPackages lib;
        in
        with pkgs;
        rec {
          omni-nntpd = beamPackages.mixRelease {
            pname = "omni_nntpd";
            version = "0.1.0";
            src = ./.;
            removeCookie = false;
            mixNixDeps = import ./deps.nix { inherit lib beamPackages; };
          };
          default = omni-nntpd;
          docker = dockerTools.buildLayeredImage {
            config.Cmd = [ "./${entrypoint}" ];
            contents = [ omni-nntpd ];
            name = "ghcr.io/neeml/omni_nntpd";
            tag = "latest";
          };
        });

      devShells = forEachSystem (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = devenv.lib.mkShell {
            inherit inputs pkgs;
            modules = [
              ./devenv.nix
            ];
          };
        });

      apps = forEachSystem (system: {
        docker = {
          type = "app";
          program = self.packages.${system}.docker;
        };
      });
    };
}
