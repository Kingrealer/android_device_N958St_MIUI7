#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 10745856 dc122265249ac203f94330c27b1ae74aff1e79db 8507392 241d6c31f7c2bc6b323e01145ea3ad18e4aee4db
fi

if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:10745856:dc122265249ac203f94330c27b1ae74aff1e79db; then
  log -t recovery "Installing new recovery image"
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:8507392:241d6c31f7c2bc6b323e01145ea3ad18e4aee4db EMMC:/dev/block/bootdevice/by-name/recovery dc122265249ac203f94330c27b1ae74aff1e79db 10745856 241d6c31f7c2bc6b323e01145ea3ad18e4aee4db:/system/recovery-from-boot.p
else
  log -t recovery "Recovery image already installed"
fi
