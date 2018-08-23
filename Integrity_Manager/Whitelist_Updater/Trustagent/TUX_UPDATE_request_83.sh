#!/usr/bin/env bash

echo "TUX UPDATE KERNEL VERSION 4.4.0-83"

USER=attest
IP=220.149.244.175
PW=M0b!le0s

expect << EOF
spawn ssh -t -o StrictHostKeyChecking=no $USER@$IP 
expect "attest@220.149.244.175's password:" {
send "$PW\r"
expect "attest@attestation:~$ " {send "sudo /home/attest/UPDATE_83.sh\r"
expect "password for attest: " {send "$PW\r" 
expect "attest@attestation:~$ " {send "exit\r"}
}
} 
}
expect eof
EOF

echo "Download Kernel"
sshpass -pM0b!le0s scp -o StrictHostKeyChecking=no attest@220.149.244.175:/home/attest/Trusted_repo/bin/vmlinuz_83_ta_.signed.efi /home/trustagent/TUX/bin/
if [ $? -eq 0 ]
then 
  echo "Kernel Download Success"
else 
  echo "Kernel Download Fail"
fi

echo "Download CFG"
sshpass -pM0b!le0s scp -o StrictHostKeyChecking=no attest@220.149.244.175:/home/attest/Trusted_repo/grub_cfg/grub.TUX.ta.83.cfg /home/trustagent/TUX/grub_cfg/
if [ $? -eq 0 ]
then 
  echo "Grub.cfg Download Success"
else 
  echo "Grub.cfg Download Fail"
fi

echo "Copying New kernel to boot partition"
cp /home/trustagent/TUX/bin/vmlinuz_83_ta_.signed.efi /boot/vmlinuz-4.4.0-83-generic.efi.signed
echo "Copying New grub.cfg to boot partition"
cp /home/trustagent/TUX/grub_cfg/grub.TUX.ta.83.cfg /boot/grub/grub.cfg
