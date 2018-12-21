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

# Papers and Presentaions 

TUX was introduced at following conferences.
 - Security and Trust Management 2018: [STM 2018](https://link.springer.com/chapter/10.1007/978-3-030-01141-3_7)
 - Linux Security Summit North America 2018:[LSS NA 2018](https://lssna18.sched.com/event/FLYN/updating-linux-with-tux-trustedupdate-on-linux-kernel-suhho-lee-dankook-university)

Vidoes
 - [LSS 2018](https://youtu.be/slNSH2LGBqA)
 - [TUX Demo](https://youtu.be/3RuTvp06vkE)


# 1.1 Introduction 
Preserving integrity is one of the essential requirements in trusted computing. However, when it comes to system update, even with the state-of-the-art integrity management system, such as Open CIT, cannot properly manage integrity information. 

This paper presents the design and implementation of Trust update regarding Linux booting (TUX). With TUX, we overcome existing limitations of the current integrity management solutions. First, TUX manages the integrity of the Linux booting process according to OS kernel updates. This allows TUX to manage its whitelist corresponding to the requested updates and perform remote attestation with appropriate whitelist values. Second, TUX proposes a novel and robust integrity verification method, PCR verification. PCR verification provides robust measurement/validation booting by employing PCR-signed kernel and TS-Boot. With these two properties, TUX ensures the thorough integrity of the Linux boot process. We also demonstrate the concept through TUX prototyping and experimental validation. Also, our experiments demonstrate proof of concepts using the prototype of TUX.

# 1.2 TUX Goals
 - TUX allows Open CIT to transparently mange local updates
 - TUX maintains whitelist according to conducted updates and  perform remote attestation using the up-to-date whites list
 - TUX performs robust measured / verified booting

# 1.3 Features 
 - Verified boot using shim_lock verification
 - PCR verification: TPM measurement comparison with kernel signature to verify entire booting process
 - Update whitelist according to the updates 

# 1.4 Architecure of TUX
 <center> <img src="document/images/TUX_design.png" width="500"></center>
#### Read paper for deatils

# COMPONENTS
TUX is composed of three parts 
 - *Integrity Manger*
 Integrity management and kernel update module.
 - *PCR signed kernel*
 Special kernel which is used during TS-boot’s integrity verification.
 - *TUX Secure boot*
 Combination of UEFI Secure boot, modified shim and modified grub, measures every binaries and commands executed during the booting process, including the grub commands and modules.

# HOW TO INSTALL
 We tested TUX using following environment. However, TS-boot can be used on any platform which runs Ubuntu 16.04 and may run on other versions as well.
>*Build environment
Ubuntu 16.04.5 LTS
>*Local machine which runned TS-boot
Dell Optiplex 7040M mini-computer
Ubuntu server 16.04 LTS x86
>*Remote attestation server
Gigabyte GT404-600-D70T
Ubuntu 14.04.5 LTS

## TS-boot: Grub, shim, keys, and how to sign.
### Grub
This build process is based upon: <https://help.ubuntu.com/community/UEFIBooting#Building_GRUB2_.28U.29EFI>. You may just run the following instructions.

