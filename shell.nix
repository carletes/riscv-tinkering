let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs {
    crossSystem = {
      config = "riscv64-unknown-linux-gnu";
    };
  };
in
  pkgs.callPackage (
    { mkShell, bashInteractive, dtc, gdb, niv, qemu }: mkShell {
      nativeBuildInputs = [
        dtc
        gdb
        qemu

        # Niv (https://github.com/nmattia/niv), to keep dependencies up-to-date.
        niv

        bashInteractive
      ];
    }
  ) {}
