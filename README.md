# fred
Nix package for fred (Forensic Registry EDitor) -- https://www.pinguin.lu/fred

## Preparing

In the root of this repo, run `pushd . ; cd ../.. && git clone https://github.com/sbond75/bcd.git ; popd` to get the hivex.nix dependency (used via `callPackage` within shell.nix in this repo). Then you can run `nix-shell` from the root of this repo.
