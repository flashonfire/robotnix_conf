{
  description = "LineageOS build for Samsung c1s";

  nixConfig = {
    extra-sandbox-paths = [ "/var/cache/ccache" ];
  };

  # inputs.robotnix.url = "/run/media/eymeric/stockage/c1s/robotnix";
  inputs.robotnix.url = "github:nix-community/robotnix";

  outputs = { self, robotnix }:
    {
      robotnixConfigurations."c1s" = robotnix.lib.robotnixSystem (
        { config, pkgs, ... }:
        {
          device = "c1s";
          flavor = "lineageos";
          flavorVersion = "23.2";

          apps.fdroid.enable = true;
          microg.enable = true;
          ccache.enable = true;

          stateVersion = "3";

          # === DEVICE TREES (miguelbarretoo) ===
          source.dirs."device/samsung/c1s".src = pkgs.fetchFromGitHub {
            owner = "miguelbarretoo";
            repo = "android_device_samsung_c1s";
            rev = "lineage-23.2";
            sha256 = "sha256-fGID0YAAl+ru3MbFSyqgHqvZxCr0uDxwjSnZH0vyrg8=";
          };

          source.dirs."device/samsung/universal9830-common".src = pkgs.fetchFromGitHub {
            owner = "miguelbarretoo";
            repo = "android_device_samsung_universal9830-common";
            rev = "lineage-23.2";
            sha256 = "sha256-HhEhH1zd1gvXn59MCNFHqyVnwfjoyFa90btXele0om0=";
          };

          # === VENDOR (miguelbarretoo + TheMuppets — exactement comme son manifest) ===
          source.dirs."vendor/samsung/c1s".src = pkgs.fetchFromGitHub {
            owner = "miguelbarretoo";
            repo = "proprietary_vendor_samsung_c1s";
            rev = "lineage-23.2";
            sha256 = "sha256-mxYSp+WjUaGBuYpweMQuWLRGqCzfaJ7prwzo5b6LRO8=";
          };

          source.dirs."vendor/samsung/universal9830-common".src = pkgs.fetchFromGitHub {
            owner = "TheMuppets";
            repo = "proprietary_vendor_samsung_universal9830-common";
            rev = "lineage-23.2";
            sha256 = "sha256-cxQ+iffrBZFc3Bqr+kUELyeGYeAdO8fVFfBGDHMUkzw=";
          };

          # === KERNEL (miguelbarretoo) ===
          source.dirs."kernel/samsung/universal9830".src = pkgs.fetchFromGitHub {
            owner = "miguelbarretoo";
            repo = "android_kernel_samsung_universal9830";
            rev = "lineage-23.2";
            sha256 = "sha256-DsjOVcBzyUHzlqXiM0mb3m1lggbYzdu5Oay7IVVfsew=";
          };

          # === HARDWARE (LineageOS) ===
          source.dirs."hardware/samsung_slsi-linaro/config".src = pkgs.fetchFromGitHub {
            owner = "LineageOS";
            repo = "android_hardware_samsung_slsi-linaro_config";
            rev = "lineage-23.2";
            sha256 = "sha256-bq3g+qSKfJ4MwvpUghXo7pMOTYcU/lIw1fFGolM2CHw=";
          };

          source.dirs."hardware/samsung_slsi-linaro/graphics".src = pkgs.fetchFromGitHub {
            owner = "LineageOS";
            repo = "android_hardware_samsung_slsi-linaro_graphics";
            rev = "lineage-23.2";
            sha256 = "sha256-6Mz5qZND8xpZv24Ojs89dV8Iv+7t2fds/3Jn9mIDPuc=";
          };

          source.dirs."hardware/samsung_slsi-linaro/exynos".src = pkgs.fetchFromGitHub {
            owner = "LineageOS";
            repo = "android_hardware_samsung_slsi-linaro_exynos";
            rev = "lineage-23.2";
            sha256 = "sha256-MUiae8IAAIYkisxsDOjty2Z+32sq3ExZSXtOmR8Ljc0=";
          };

          source.dirs."hardware/samsung_slsi-linaro/exynos5".src = pkgs.fetchFromGitHub {
            owner = "LineageOS";
            repo = "android_hardware_samsung_slsi-linaro_exynos5";
            rev = "lineage-23.2";
            sha256 = "sha256-2TWqYim/Od4kF+H/buGN2bOKGgdUJi39e0xr62wXs4s=";
          };

          source.dirs."hardware/samsung_slsi-linaro/interfaces".src = pkgs.fetchFromGitHub {
            owner = "LineageOS";
            repo = "android_hardware_samsung_slsi-linaro_interfaces";
            rev = "lineage-23.2";
            sha256 = "sha256-kF/ZbSp5zcp5as+Yb24ru1UusI8QSgMDBSbW5YK2qII=";
          };

          source.dirs."hardware/samsung_slsi-linaro/openmax".src = pkgs.fetchFromGitHub {
            owner = "LineageOS";
            repo = "android_hardware_samsung_slsi-linaro_openmax";
            rev = "lineage-23.2";
            sha256 = "sha256-Vw8OGU86mwMB0vrQxkX/ewJ9bMU9ps4v3Y18m7JmuSc=";
          };

          # === SEPOLICY (LineageOS) ===
          source.dirs."device/samsung_slsi/sepolicy".src = pkgs.fetchFromGitHub {
            owner = "LineageOS";
            repo = "android_device_samsung_slsi_sepolicy";
            rev = "lineage-23.2";
            sha256 = "sha256-I9YJqAJwLDVyAoWDPqbJMeUicKXxzFah0Mk2cdfj5So=";
          };

          # === EXTRAS (pas dans son manifest mais nécessaires pour robotnix/LineageOS) ===
          source.dirs."hardware/samsung".src = pkgs.fetchFromGitHub {
            owner = "LineageOS";
            repo = "android_hardware_samsung";
            rev = "lineage-23.2";
            sha256 = "sha256-9BqiNiA5yyepTEDzux3z0PEmesNyVangtyBVGLQxPoY=";
          };

          source.dirs."hardware/samsung_slsi-linaro/codec2".src = pkgs.fetchFromGitHub {
            owner = "LineageOS";
            repo = "android_hardware_samsung_slsi-linaro_codec2";
            rev = "lineage-23.2";
            sha256 = "sha256-A5b+dNjXl6zUC7dEPOVeppcxb6P2pNX8Lowi9DGcQh4=";
          };

          source.dirs."hardware/samsung_slsi-linaro/sgpu".src = pkgs.fetchFromGitHub {
            owner = "LineageOS";
            repo = "android_hardware_samsung_slsi-linaro_sgpu";
            rev = "lineage-23.2";
            sha256 = "sha256-wFZBMW131abidcP793NGHts3EL4HH2snbbO1SbegtfM=";
          };

          source.dirs."hardware/broadcom/libbt".src = pkgs.fetchFromGitHub {
            owner = "LineageOS";
            repo = "android_hardware_broadcom_libbt";
            rev = "lineage-23.2";
            sha256 = "sha256-TP0vGvkQIdxnRpUhjzA8JE1yz+vIeuZJ3lgwK/w2zGw=";
          };

          source.dirs."bootable/deprecated-ota".src = pkgs.fetchFromGitHub {
            owner = "LineageOS";
            repo = "android_bootable_deprecated-ota";
            rev = "lineage-23.2";
            sha256 = "sha256-RUxRmq9K2o3Bimc5ZxRV/TdIVSyJk3xCYAaIkW4sKbg=";
          };
        }
      );

      packages.x86_64-linux.default = self.robotnixConfigurations."c1s".img;
    };
}
