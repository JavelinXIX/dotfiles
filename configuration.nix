{ config, pkgs, ... }:

{
    imports = [./hardware-configuration.nix];

    # Boot Loader
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.timeout = 0;


    # Negworking
    networking.hostname = "nixos";
    network.wireless.enable = true;

    # Time Zone
    time.timeZone = "Asia/Tokyou";

    # Locale
    i18n.defaultLocale = "en_US.UTF-8";

    # Input Method
    i18n.inputMethod ={
        enable = true;
	type = "fcitx5";
	fcitx5 = {
	    addons = with pkgs; [
	        fcitx5-mozc
		fcitx5-gtk 
		fcitx5-nord
	    ];
        };
    };

    # Font
    fonts = {
        packages = (with pkgs; [
            noto-fonts
            noto-fonts-extra
            noto-fonts-cjk-sans
            noto-fonts-emoji
	]);

	fontconfig = {
	    enable = true;
	    defaultFonts = {
	        serif = [ "Noto Serif CJK JP" ];
                sansSerif = [ "Noto Sans CJK JP" ];
                monospace = [ "JetBrains Mono" ];
            };
        };
    };

    # XServer
    services.xserver.enable = true;

    # Display Manager
    services.xserver.desktopManager.xfce.enable = true;
    services.xserver.displayManager.lightdm.enable = true;
    services.xserver.displayManager.lightdm.greeters.slick.enable = true;

    services.dbus.enable = true;
    services.polkit.enable = true;

    # Sound
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        pulse.enable = true;
    };

    # User
    users.users.tomoya-f = {
        isNormalUser = true;
        extraGroups = [ 
	    "wheel"
	    "networkmanager"
	    "audio"
        ];
    };


}
