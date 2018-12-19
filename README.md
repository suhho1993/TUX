```bash
████████╗██╗   ██╗██╗  ██╗
╚══██╔══╝██║   ██║╚██╗██╔╝
   ██║   ██║   ██║ ╚███╔╝ 
   ██║   ██║   ██║ ██╔██╗ 
   ██║   ╚██████╔╝██╔╝ ██╗
   ╚═╝    ╚═════╝ ╚═╝  ╚═╝
                          
Trusted Updated regarding Linux Booting
```
---
# TUX
TUX is a novel integrity manager to maintain integrity along with the frequent updates

# 1.1 Papers and Presentaions 

TUX was introduced at following conferences.
 - Security and Trust Management 2018: [STM 2018](https://link.springer.com/chapter/10.1007/978-3-030-01141-3_7)
 - Linux Security Summit North America 2018:[LSS NA 2018](https://lssna18.sched.com/event/FLYN/updating-linux-with-tux-trustedupdate-on-linux-kernel-suhho-lee-dankook-university)

Vidoes
 - [LSS 2018](https://youtu.be/slNSH2LGBqA)

# 1.2 TUX Goals
 - TUX allows Open CIT to transparently mange local updates
 - TUX maintains whitelist according to conducted updates and  perform remote attestation using the up-to-date whites list
 - TUX performs robust measured / verified booting

# 1.3 Features 
 - Verified boot using shim_lock verification
 - PCR verification: TPM measurement comparison with kernel signature to verify entire booting process
 - Update whitelist according to the updates 

#### Read paper for deatils
---

#COMPONENTS
TUX is composed of three parts 
 - Integrity Manger
 - PCR signed kernel
 - TUX Secure boot
