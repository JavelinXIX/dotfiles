{ config, pkgs, ...}:

{
    nixpkgs.config.allowUnfree = true;

    home.username = "tomoya-f";
    home.homeDirectory = "/home/tomoya-f";

    home.packages = with pkgs; [
        git
        google-chrome
        rofi
        wezterm
        unzip
        virt-manager
        virt-viewer
        ffmpeg
        codex
    ];

    imports = [
        ./xfce.nix
    ];

    home.stateVersion = "25.05";
}

