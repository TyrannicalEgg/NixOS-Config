{ pkgs, ... }: {
  import = [ ./ash ./valentin ./vulpes ];
  users.defaultUserShell = pkgs.zsh;
}
