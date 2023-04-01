{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?rev=ce6aa13369b667ac2542593170993504932eb836";
  };

  outputs = { self, nixpkgs }: {
    packages.x86_64-linux.lolo = nixpkgs.legacyPackages.x86_64-linux.firefox;
  };
}
