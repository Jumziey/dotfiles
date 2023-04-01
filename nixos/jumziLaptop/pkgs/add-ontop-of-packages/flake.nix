{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-old.url = "github:nixos/nixpkgs?rev=ce6aa13369b667ac2542593170993504932eb836";
  };

  outputs = { self, nixpkgs, nixpkgs-old }: {
    legacyPackages.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux // { firefox = nixpkgs-old.legacyPackages.x86_64-linux.firefox;  };
  };
}
