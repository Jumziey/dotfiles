{
  description = "A flake for building bitwarden-bws";

  inputs = {
    rust-overlay.url = "github:oxalica/rust-overlay";
    flake-utils.follows = "rust-overlay/flake-utils";
    nixpkgs.follows = "rust-overlay/nixpkgs";
  };

  outputs = inputs: with inputs;
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in rec {
        packages = {
          bitwarden-bws = pkgs.rustPlatform.buildRustPackage {
            pname = "bitwarden-bws";
            version = "0.3.0";
            cargoBuildFlags = "-p bws";
            nativeBuildInputs = [ pkgs.pkg-config pkgs.python3 ];
            buildInputs = [ pkgs.openssl ];
            src = pkgs.fetchFromGitHub {
              owner = "bitwarden";
              repo = "sdk";
              rev = "bws-v0.3.0";
              sha256 = "11mxg65r98pjjf54jad7288b4z8ipvg7qgqhnvp5gwrws4xndsx3";
            };
            cargoHash = "sha256-b7GtBd1fM5cf80qY4XLFFZ/WEGjWvZ3ulSGDSX6OWdQ=";
          };
          default = packages.bitwarden-bws;
        };
      }
    );
}
