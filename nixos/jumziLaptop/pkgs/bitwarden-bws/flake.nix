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
            version = "0.2.1";
            cargoBuildFlags = "-p bws";
            nativeBuildInputs = [ pkgs.pkg-config pkgs.python3 ];
            buildInputs = [ pkgs.openssl ];
            src = pkgs.fetchFromGitHub {
              owner = "bitwarden";
              repo = "sdk";
              rev = "bws-v0.2.1";
              sha256 = "1rm0zvzrziyfdfh3ham6b5ppacdi7f8cy2cs04m96a6vc8aq41z1";
            };
            cargoHash = "sha256-YroKR1HUCv8ypfK8RagpB9VsKe1xZHrpN9kOS7WndsM=";
          };
          default = packages.bitwarden-bws;
        };
      }
    );
}
