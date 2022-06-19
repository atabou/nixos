# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

	imports = [
		./hardware-configuration.nix # Include the results of the hardware scan.
	];

	# Bootloader.
	boot.loader.grub.enable = true;
	boot.loader.grub.device = "/dev/sda";
	boot.loader.grub.useOSProber = true;

	networking.hostName = "nixos"; # Define your hostname.
	# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

	# Configure network proxy if necessary
	# networking.proxy.default = "http://user:password@proxy:port/";
	# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

	# Enable networking
	networking.networkmanager.enable = true;

	# Set your time zone.
	time.timeZone = "Asia/Beirut";

	# Select internationalisation properties.
	i18n.defaultLocale = "en_US.utf8";

	# Configure x11 xserver

	services.xserver.enable = true;
	services.xserver.layout = "us";
	services.xserver.xkbVariant = "";
	
	# Configure x11 display manager

	services.xserver.displayManager.sddm.enable = true;
	
	# Configure xmonad

	services.xserver.windowManager.xmonad.enable = true;
	services.xserver.windowManager.xmonad.enableContribAndExtras = true;

	# Set video drivers

	services.xserver.videoDrivers = [ "nvidia" "modesetting" ];

	# Programs to enable

	programs.git.enable = true;

	programs.zsh = {

		enable = true;

		enableAutosuggestions = true;

		enableSyntaxHighlighting = true;

		oh-my-zsh = {

			enable = true;
			plugins = [];
			theme = "robbyrussell";
		
		};

	};

	# Define a user account. Don't forget to set a password with ‘passwd’.
	users.users.atabou = {

		isNormalUser = true;
		description = "Andre Tabourian";
		extraGroups = [ "networkmanager" "wheel" ];
		shell = pkgs.zsh;
	
	};

	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

	# Programs to enable

	# List packages installed in system profile. To search, run:
	# $ nix search wget
	environment.systemPackages = with pkgs; [
		curl
		neovim
		wget
		nitrogen
		alacritty
		dmenu
		xmobar
		gcc
	];

	# Some programs need SUID wrappers, can be configured further or are
	# started in user sessions.
	# programs.mtr.enable = true;
	# programs.gnupg.agent = {
	#   enable = true;
	#   enableSSHSupport = true;
	# };

	# List services that you want to enable:

	# Enable the OpenSSH daemon.
	# services.openssh.enable = true;

	# Open ports in the firewall.
	# networking.firewall.allowedTCPPorts = [ ... ];
	# networking.firewall.allowedUDPPorts = [ ... ];
	# Or disable the firewall altogether.
	# networking.firewall.enable = false;

	# This value determines the NixOS release from which the default
	# settings for stateful data, like file locations and database versions
	# on your system were taken. It‘s perfectly fine and recommended to leavecatenate(variables, "bootdev", bootdev)
	# this value at the release version of the first install of this system.
	# Before changing this value read the documentation for this option
	# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "22.05"; # Did you read the comment?

}
