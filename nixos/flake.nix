{
  description = "JumziConf";
  input = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = { nixpkgs, ... }: 
    let 
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {allowUnfree = true;};
      };
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        jumziLaptop = lib.nixosSystem {
          inherit system;
          modules = [
            ./configuration.nix
          ];
        };
      };
    };
}
