{ config, pkgs, ... }:

{
    xfconf = {
        enable = true;
        settings = {
            xfce4-keyboard-shortcuts = {
                # カスタムショートカットがプリセットより優先されるようにするフラグ
                "commands/custom/override" = true;

                # ここから下が「追加するショートカット」
                "commands/custom/<Primary><Alt>t" = "wezterm";
                "commands/custom/<Super>r"        = "rofi -show drun";
                "commands/custom/<Super>l"        = "xflock4";
            };
        };
    };
}

