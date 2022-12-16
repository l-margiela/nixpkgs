{ config, pkgs, ... }:

  let
    doom-emacs = pkgs.callPackage (builtins.fetchTarball {
      url = https://github.com/nix-community/nix-doom-emacs/archive/master.tar.gz;
    }) {
      doomPrivateDir = ./doom.d;  # Directory containing your config.el init.el
                                  # and packages.el files
    };
in {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "hhes";
  home.homeDirectory = "/home/hhes";



  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    _1password-gui
    starship
    #doom-emacs
    vscode
    vorta
  ];
  
  programs.git = {
    enable = true;
    userName = "Lukasz Margiela";
    userEmail = "lukasz+git@margiela.org";
  };

  programs.zsh = {
    enable = true;
  };
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  services.syncthing = {
    enable = true;
    tray.enable = true;
  };


  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";
}

