{
  description = "LineageOS build for OnePlus 12";

  nixConfig = {
    extra-sandbox-paths = [ "/var/cache/ccache" ];
  };

  inputs.robotnix.url = "github:nix-community/robotnix";

  outputs =
    { self, robotnix }:
    {
      robotnixConfigurations = {
        "waffle" = robotnix.lib.robotnixSystem (
          { ... }:
          {
            device = "waffle";
            flavor = "lineageos";
            flavorVersion = "23.2";

            apps.fdroid.enable = true;
            microg.enable = true;
            ccache.enable = true;

            # apps.updater.enable = true;
            # apps.updater.url = "";

            stateVersion = "3";

          }
        );
      };

      packages.x86_64-linux.default = self.robotnixConfigurations."waffle".img;
    };
}
