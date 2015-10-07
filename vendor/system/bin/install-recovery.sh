#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 9379840 c2563beab4d93e0d1eebca687917081401fc821d 6639616 8f5874561be01d5e63fb237f4b2a1fe3352b22ec
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:9379840:c2563beab4d93e0d1eebca687917081401fc821d; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:6639616:8f5874561be01d5e63fb237f4b2a1fe3352b22ec EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery c2563beab4d93e0d1eebca687917081401fc821d 9379840 8f5874561be01d5e63fb237f4b2a1fe3352b22ec:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
