{ system ? builtins.currentSystem, pkgs ? import ../nix { inherit system; } }:
pkgs.mkShell {
  buildInputs = [
    pkgs.jq
    pkgs.go
    pkgs.gomod2nix
    (pkgs.callPackage ../. {
      rocksdb = pkgs.rocksdb.override { enableJemalloc = true; };
    }) # cronosd
    pkgs.start-scripts
    pkgs.go-ethereum
    pkgs.pystarport
    pkgs.gorc
    pkgs.cosmovisor
    pkgs.poetry
    pkgs.nodejs
    pkgs.git
    pkgs.dapp
    pkgs.solc-versions.solc_0_6_8
    pkgs.test-env
    pkgs.nixpkgs-fmt
    pkgs.rocksdb
    (import ../nix/testenv.nix { inherit pkgs; })
    (import ../nix/chainmain.nix { inherit pkgs; })
    (import ../nix/hermes.nix { inherit pkgs; })
  ];
}
