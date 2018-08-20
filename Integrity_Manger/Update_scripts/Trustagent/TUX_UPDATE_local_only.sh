#!/usr/bin/env bash

echo "TUX UPDATE LOCAL ONLY"
echo "Updating to Kernel version 4.4.0-62"

echo "Copying New kernel to boot partition"
cp /home/trustagent/TUX/bin/vmlinuz_62_ta_.signed.efi /boot/vmlinuz-4.4.0-62-generic.efi.signed

echo "Copying New Grub.cfg to boot partition"
cp /home/trustagent/TUX/grub_cfg/grub.TUX.ta.62.cfg /boot/grub/grub.cfg
