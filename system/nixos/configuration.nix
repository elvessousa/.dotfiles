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
      efi = { 
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      systemd-boot = {
        configurationLimit = 10;
        consoleMode = "max";
        enable = true;
      };
    };
  };

  # Nix
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    settings = {
      experimental-features = "nix-command flakes";
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
    127.0.0.1 fepo.elf
    127.0.0.1 idestudante.elf
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
  
  # Enable the GNOME Desktop Environment.
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;
  # services.xserver.displayManager.defaultSession = "gnome";
  
  # Enable KDE
  services.xserver.displayManager.defaultSession = "plasmawayland";
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  
  # DConf
  programs.dconf.enable = true;

  # Portals
  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
    };
  };

  # Flatpak
  services.flatpak.enable = true;
  
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
  };

  # Fonts
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
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

  # Virtualization
  virtualisation.libvirtd.enable = true;

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
      celluloid
      ffmpeg
      flatpak
      fondo
      fragments
      gimp
      gnome.dconf-editor
      gnome-extension-manager
      gnome.gnome-boxes
      gnome.gnome-software
      gnome.gnome-tweaks
      inkscape
      insomnia
      neovim
      nodejs
      nushell
      onlyoffice-bin
      rustup
      ryujinx
      starship
      thunderbird
      unstable.firefox
      unstable.helix
      unstable.yazi
      vscodium
      wl-clipboard-x11
      zellij
    ];
  };

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    bat
    black
    gcc
    git
    glibc
    gsettings-qt
    gsettings-desktop-schemas
    nil
    php
    php81Packages.composer
    python310Packages.pip
    python3Full
    taplo
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
        "idestudante.elf" = (makeHost "idestudante.elf");
        "fepo.elf" = (makeHost "fepo.elf");
      };
  };
  
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
    settings = { "mysqld" = { "port" = 3308; }; };
    initialScript =
      pkgs.writeText "initial-script" ''
        CREATE USER IF NOT EXISTS 'root'@'localhost' IDENTIFIED BY 'root';
        
        CREATE DATABASE IF NOT EXISTS wordpress;
        CREATE DATABASE IF NOT EXISTS idestudante;
        CREATE DATABASE IF NOT EXISTS fepo;
                
        GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost';
        GRANT ALL PRIVILEGES ON idestudante.* TO 'root'@'localhost';
        GRANT ALL PRIVILEGES ON fepo.* TO 'root'@'localhost';
      '';
    ensureDatabases = [ "wordpress" "fepo" "idestudante" ];
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
  system.stateVersion = "23.11"; # Did you read the comment?
}
