{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  devcontainer.enable = true;

  packages = with pkgs; [
    nodejs_24
    pnpm
    (writeShellScriptBin "pi" ''
      exec ${nodejs_24}/bin/node "${config.devenv.root}/node_modules/@earendil-works/pi-coding-agent/dist/bundle/cli.js" "$@"
    '')
  ];
}
