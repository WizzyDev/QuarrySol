{ pkgs, saber-pkgs }:

with saber-pkgs;

pkgs.buildEnv {
  name = "ci";
  paths = with pkgs;
    (pkgs.lib.optionals pkgs.stdenv.isLinux [ udev ]) ++ [
      anchor-0_24_2
      cargo-workspaces
      solana-1_10-basic

      nodejs
      yarn
      python3

      pkg-config
      openssl
      jq
      gnused

      libiconv
    ] ++ (pkgs.lib.optionals pkgs.stdenv.isDarwin [
      pkgs.darwin.apple_sdk.frameworks.AppKit
      pkgs.darwin.apple_sdk.frameworks.IOKit
      pkgs.darwin.apple_sdk.frameworks.Foundation
    ]);
}
