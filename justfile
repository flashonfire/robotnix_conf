generate-keys:
    nom build .#robotnixConfigurations.c1s.generateKeysScript --out-link generate-keys-script
    ./generate-keys-script keys

generate-signed:
    nom build .#robotnixConfigurations.c1s.releaseScript --out-link release-script
    ./release-script keys

build-img:
    nom build .#robotnixConfigurations.c1s.img

build-ota:
    nom build .#robotnixConfigurations.c1s.ota
