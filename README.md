# fred
Nix package for fred (Forensic Registry EDitor) -- https://www.pinguin.lu/fred

## Preparing

In the root of this repo, run `pushd . ; cd ../.. && git clone https://github.com/sbond75/bcd.git ; popd` to get the hivex.nix dependency (used via `callPackage` within shell.nix in this repo). Then you can run `nix-shell` from the root of this repo, and `fred` to run fred. If it gives an error about `Failed to finding matching FBConfig` followed by `Could not initialize GLX`, try using `export QT_XCB_GL_INTEGRATION=none` before running `fred` ([source](https://github.com/NixOS/nixpkgs/issues/82959#issuecomment-657306112)).
