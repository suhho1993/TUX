#!/usr/bin/env bash

echo "TUX UPDATE KERNEL VERSION 4.4.0-62"

USER=attest
IP=220.149.244.175
PW=M0b!le0s

expect << EOF
spawn ssh -t -o StrictHostKeyChecking=no $USER@$IP 
expect "attest@220.149.244.175's password:" {
send "$PW\r"
expect "attest@attestation:~$ " {send "sudo /home/attest/UPDATE_62.sh\r"
expect "password for attest: " {send "$PW\r" 
expect "attest@attestation:~$ " {send "exit\r"}
}
} 
}
expect eof
EOF

sshpass -pM0b!le0s scp -o StrictHostKeyChecking=no attest@220.149.244.175:/home/attest/Trusted_repo/bin/vmlinuz_62_ta_.signed.efi /home/trustagent/TUX/bin/
if [ $? -eq 0 ]
then 
  echo "Kernel Download Success"
else 
  echo "Kernel Download Fail"
fi
sshpass -pM0b!le0s scp -o StrictHostKeyChecking=no attest@220.149.244.175:/home/attest/Trusted_repo/grub_cfg/grub.TUX.ta.62.cfg /home/trustagent/TUX/grub_cfg/
if [ $? -eq 0 ]
then 
  echo "Grub.cfg Download Success"
else 
  echo "Grub.cfg Download Fail"
fi
echo "Copying New kernel to boot partition"
cp /home/trustagent/TUX/bin/vmlinuz_62_ta_.signed.efi /boot/vmlinuz-4.4.0-62-generic.efi.signed
echo "Copying New Grub.cfg to boot partition"
cp /home/trustagent/TUX/grub_cfg/grub.TUX.ta.62.cfg /boot/grub/grub.cfg
