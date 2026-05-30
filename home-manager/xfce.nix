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

                # Window配置
                # 左半分
                "commands/custom/<Super>Left" = "xfwm4 --tile-left";
                # 右半分
                "commands/custom/<Super>Right" = "xfwm4 --tile-right";
            };
            "xfwm4" = {
                "general/keybinding_cycle_windows" = "<Alt>Tab";
                "general/keybinding_cycle_windows_reverse" = "<Alt><Shift>Tab";
            };
        };
    };
}

