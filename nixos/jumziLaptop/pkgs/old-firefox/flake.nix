{
  description = "A very basic flake";
  inputs = {
    nixpkgs-old.url = "github:nixos/nixpkgs?rev=ce6aa13369b667ac2542593170993504932eb836";
  };

  outputs = { self, nixpkgs-old }: {
    packages.x86_64-linux.default = nixpkgs-old.legacyPackages.x86_64-linux.firefox;
    myOldFirefox =  nixpkgs-old.legacyPackages.x86_64-linux.firefox; 
  };
}
