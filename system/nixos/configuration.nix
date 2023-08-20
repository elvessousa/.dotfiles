# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  unstableTarball =
    fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot = {
    loader = {
      efi = { canTouchEfiVariables = true; };
      systemd-boot = {
        configurationLimit = 10;
        consoleMode = "max";
        enable = true;
      };
    };
  };

  # AMD ROCm
  hardware.opengl.enable = true;
  hardware.opengl.extraPackages = [ pkgs.rocm-opencl-icd ];
  
  networking.hostName = "elf"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.extraHosts = ''
    127.0.0.1 local.elf
  '';
  
  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
  i18n.defaultLocale = "pt_BR.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Flatpak
  services.flatpak.enable = true;
  
  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "br";
    xkbVariant = "";
  };

  # Configure console keymap
  console.keyMap = "br-abnt2";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  
  # Fonts
  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      fira
      (nerdfonts.override { fonts = [ "FiraCode" ]; })
    ];
    fontconfig = {
      defaultFonts = {
        serif = [ "Fira Sans" ];
        sansSerif = [ "Fira Sans" ];
        monospace = [ "FiraCode Nerd Font Retina" ];
      };
    };
  };

  # Allow unfree packages 
  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = pkgs: {
      unstable = import unstableTarball {
        config = config.nixpkgs.config;
      };
    };
  };
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.elvessousa = {
    isNormalUser = true;
    description = "Elves Sousa";
    extraGroups = [ "networkmanager" "wheel" "nginx" ];
    packages = with pkgs; [
      adw-gtk3
      alacritty
      blender-hip
      ffmpeg
      firefox
      flatpak
      fondo
      gimp
      gnome.dconf-editor
      gnome.gnome-boxes
      gnome.gnome-software
      gnome.gnome-tweaks
      helix
      inkscape
      insomnia
      neovim
      nodejs
      nushell
      onlyoffice-bin
      rustup
      ryujinx
      starship
      # unstable.davinci-resolve
      vscodium
      wl-clipboard-x11
      zellij
    ];
  };

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    bat
    exa
    gcc
    git
    glibc
    nil
    php
    unzip
    vim
    wget
  ];

  # LEMP Stack
  services.nginx = {
    user = "elvessousa";
    enable = true;
    virtualHosts = 
      let
        makeHost = address: {
          root = "/var/www/${address}";
          serverName = address;
          serverAliases = [ address ];
          extraConfig = ''
            index index.php;
          '';
          listen = [{ port = 80;  addr="0.0.0.0"; }];
          locations = {
            "/".extraConfig = ''
              try_files $uri $uri/ /index.php?$args;
            '';
            "~* /(?:uploads|files)/.*\.php$".extraConfig = ''
              deny all; 
            '';
            "~ \.php$".extraConfig = ''
              fastcgi_intercept_errors on;
              fastcgi_pass  unix:${config.services.phpfpm.pools.mypool.socket};
            '';
            "~* \.(js|css|png|jpg|jpeg|gif|ico)$".extraConfig = ''
                expires max;
                log_not_found off;
            '';
          };
        };
      in
      {
        "local.elf" = (makeHost "local.elf");
      };
  };
  
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
    settings = { "mysqld" = { "port" = 3308; }; };
    initialScript =
      pkgs.writeText "initial-script" ''
        CREATE DATABASE IF NOT EXISTS wordpress;
        CREATE USER IF NOT EXISTS 'root'@'localhost' IDENTIFIED BY 'root';
        GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost';
      '';
    ensureDatabases = [ "wordpress" ];
    ensureUsers = [
      {
        name = "root";
        ensurePermissions = {
          "root.*" = "ALL PRIVILEGES";
          "*.*" = "ALL PRIVILEGES";
        };
      }
    ];
  };
  
  services.phpfpm.pools.mypool = {
    user = "nobody";
    settings = {
      pm = "dynamic";
      "listen.owner" = config.services.nginx.user;
      "pm.max_children" = 5;
      "pm.start_servers" = 2;
      "pm.min_spare_servers" = 1;
      "pm.max_spare_servers" = 3;
      "pm.max_requests" = 500;
    };
  };
  
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
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
