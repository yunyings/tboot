GRUB_MODULES="all_video boot btrfs cat chain configfile echo efifwsetup \
efinet ext2 fat font gfxmenu gfxterm gzio halt hfsplus iso9660 \
jpeg loadenv lvm mdraid09 mdraid1x minicmd normal part_apple \
part_msdos part_gpt password_pbkdf2 png reboot search \
search_fs_uuid search_fs_file search_label sleep syslinuxcfg \
test tftp regexp video xfs linuxefi multiboot multiboot2"
grub2-mkimage -O x86_64-efi -o grubx64.efi.new -p /EFI/sles $GRUB_MODULES
