#!/bin/bash

efibootmgr --create --disk /dev/nvme0n1 --part 1 --loader "/EFI/Linux/Linux.efi" --label "Arch Linux (Signed)" --verbose
