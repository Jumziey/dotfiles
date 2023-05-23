{
  description = "JumziConf";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    jumzipkgs.url = "./pkgs/bitwarden-bws";
  };

  outputs = { nixpkgs, jumzipkgs, ... }: 
    let 
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {allowUnfree = true;};
      };
      jpkgs = jumzipkgs.packages.${system};
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        jumziLaptop = lib.nixosSystem {
          inherit system;
          specialArgs = {inherit jpkgs;};
          modules = [
            ./configuration.nix 
          ];
        };
      };
    };
}
