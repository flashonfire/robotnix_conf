device := "waffle"

generate-keys:
    nom build .#robotnixConfigurations."{{device}}".generateKeysScript --out-link generate-keys-script
    ./generate-keys-script keys

generate-signed:
    nom build .#robotnixConfigurations."{{device}}".releaseScript --out-link release-script
    ./release-script keys

build-img:
    nom build .#robotnixConfigurations."{{device}}".img

build-ota:
    nom build .#robotnixConfigurations."{{device}}".ota
