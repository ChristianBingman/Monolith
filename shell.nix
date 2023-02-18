# simple.nix
with (import <nixpkgs> {});
mkShell {
  buildInputs = [
    pkgs.ansible
    pkgs.ripgrep
    pkgs.jq
    pkgs.terraform
  ];
}
