{ config, pkgs, ... }:

{
    imports = [
        ./hardware-configuration.nix
    ];

    # Boot Loader
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.timeout = 0;


    # Negworking
    networking.hostName = "nixos";
    networking.wireless.enable = true;

    # Time Zone
    time.timeZone = "Asia/Tokyo";

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

    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "jp";
      variant = "";
    };

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
    
    # Programs
    environment.systemPackages = with pkgs; [
        neovim
	curl
	wget
	zsh
	tmux
    ];

    programs.firefox.enable = true;
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    
    system.stateVersion = "25.05"; # Did you read the comment?
}
