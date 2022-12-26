objcopy --add-section .osrel="/usr/lib/os-release" --change-section-vma .osrel=0x20000 \
	--add-section .cmdline="/boot/cmdline" --change-section-vma .cmdline=0x30000 \
	--add-section .linux="/boot/vmlinuz-linux-hardened" --change-section-vma .linux=0x40000 \
	--add-section .initrd="/boot/initramfs-linux-hardened.img" --change-section-vma .initrd=0x3000000 \
	"/usr/lib/systemd/boot/efi/linuxx64.efi.stub" "/boot/EFI/Linux/Linux.efi"

sbsign  --key /etc/bootloader/keys/bootloader_local.key \
	--cert /etc/bootloader/keys/bootloader_local.crt \
	--output /boot/EFI/Linux/Linux.efi /boot/EFI/Linux/Linux.efi
