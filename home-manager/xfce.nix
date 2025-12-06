{ config, pkgs, ... }:

{
  xdg.configFile."xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml".text = ''
    <?xml version="1.0" encoding="UTF-8"?>
    <channel name="xfce4-keyboard-shortcuts" version="1.0">

      <!-- ctrl + alt + t → wezterm -->
      <property name="commands/custom/<Primary><Alt>t" type="string" value="wezterm"/>

      <!-- super + r → rofi -show drun -->
      <property name="commands/custom/<Super>r" type="string" value="rofi -show drun"/>

      <!-- super + l → ロック -->
      <property name="commands/custom/<Super>l" type="string" value="xflock4"/>

      <!-- XFCE が独自に追加するプリセット（必要なら保持） -->
      <property name="providers" type="array">
        <value type="string" value="commands"/>
        <value type="string" value="xfwm4"/>
      </property>
    </channel>
  '';
}

