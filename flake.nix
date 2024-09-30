{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    devenv.url = "github:cachix/devenv";
  };

  nixConfig = {
    extra-trusted-public-keys = "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=";
    extra-substituters = "https://devenv.cachix.org";
  };

  outputs = { self, nixpkgs, devenv, ... } @ inputs:
    let
      forEachSystem = nixpkgs.lib.genAttrs ["x86_64-linux"];
    in
    {
      packages = forEachSystem (system:
        let
          pkgs = inputs.nixpkgs.legacyPackages.${system};
          entrypoint = pkgs.writeShellScript "entrypoint" ''
            /bin/omni_nntpd eval "OmniNNTPd.Release.migrate"
            /bin/omni_nntpd start
          '';
          inherit (pkgs) beamPackages lib;
        in
        rec {
          omni-nntpd = beamPackages.mixRelease {
            pname = "omni_nntpd";
            version = "0.1.0";
            src = ./.;
            removeCookie = false;
            mixNixDeps = import ./deps.nix { inherit lib beamPackages; };
          };
          default = omni-nntpd;
          docker = pkgs.dockerTools.buildLayeredImage {
            config.Cmd = [ "./${entrypoint}" ];
            contents = [ omni-nntpd ];
            name = "ghcr.io/neeml/omni_nntpd";
            tag = "latest";
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
