{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "vheac";
  home.homeDirectory = "/home/vheac";
 
  
  # Automatic Garbage Collection
  nix.gc = {
    automatic = true;
    frequency = "weekly";
    options = "--delete-older-than 2d";
    };

    nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };
  
#cursorTheme theme

   home.pointerCursor = {
     package = pkgs.catppuccin-cursors.mochaLight;

      name = "Catppuccin-Mocha-Light-Cursors";

     size = 17;
   };

# gtk theme
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Compact-Mauve-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        size = "compact";
        tweaks = [ "rimless" "black" ];
        variant = "mocha";
      };
    };

  # cursorTheme
    cursorTheme = {
      package = pkgs.catppuccin-cursors.mochaLight;
      name = "Catppuccin-Mocha-Light-Cursors";
    };

  # icons 
    iconTheme = {
      package =  pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
  };

  # qt theme
  qt = {
    enable = true;
    platformTheme = "gtk";
    style = {
        name = "Catppuccin Mocha Mauve Modern";
        package = pkgs.catppuccin-kde.override {
        flavour = [ "mocha" ];
        accents = [ "mauve" ];
        winDecStyles = [ "modern" ];
        };
      };
    };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.libgccjit
    pkgs.libgcc
    pkgs.gcc
    pkgs.ripgrep
    pkgs.unzip
    pkgs.nodejs_21
    pkgs.python3
    pkgs.lua
  

    pkgs.pcmanfm
   #pkgs.lxappearance-gtk2
   #pkgs.qt5c
   #pkgs.libsForQt5.qt5ct


    pkgs.git
    pkgs.wget
    
    pkgs.waybar
  #  pkgs.networkmanagerapplet
    pkgs.swww
    pkgs.dunst
    pkgs.libnotify


    pkgs.neofetch
    pkgs.htop
    
    pkgs.rofi-wayland
    pkgs.kitty
    pkgs.neovim
    pkgs.kate
    pkgs.firefox
    pkgs.thunderbird
    pkgs.spotify
    pkgs.discord
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    (pkgs.nerdfonts.override { fonts = [ "SourceCodePro" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/vheac/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
     EDITOR = "neovim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;



  programs.git= {
    enable= true;
    userName= "KubaVencel";
    userEmail= "j.vencel27@gmail.com";
    aliases= {
    pu= "push";
    co= "checkout";
    cm= "commit";
    };
  };




}
