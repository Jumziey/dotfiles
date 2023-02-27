{
  description = "JumziConf";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?rev=568db3e44723d02431ba0e83321f64f17e3d5d51";
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
