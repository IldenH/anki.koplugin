with import <nixpkgs> {};
  mkShell {
    packages = [
      nixd
      alejandra

      lua-language-server
      stylua
    ];
  }
