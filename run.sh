#!/usr/bin/env bash
set -eu

SRC_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

if [[ ! $(stat -c '%U' $SRC_DIR/Downloads/Linux_for_Tegra/ 2>/dev/null) == "root" ]]; then
	sudo apt install lbzip2 device-tree-compiler
	mkdir -p $SRC_DIR/Downloads/Linux_for_Tegra
	mkdir -p $SRC_DIR/backup
	cd $SRC_DIR/Downloads
	wget -c https://developer.nvidia.com/embedded/dlc/Jetson-210_Linux_R32.2.1 -O Jetson-Nano-Tegra210_Linux_R32.2.1_aarch64.tbz2
	wget -c https://developer.nvidia.com/embedded/dlc/r32-2-1_Release_v1.0/Nano-TX1/Tegra_Linux_Sample-Root-Filesystem_R32.2.1_aarch64.tbz2 -O Jetson-Nano-Tegra_Linux_Sample-Root-Filesystem_R32.2.1_aarch64.tbz2
	md5sum -c $SRC_DIR/MD5SUM || { echo File download error.; exit 1; }
	tar xvf Jetson-Nano-Tegra210_Linux_R32.2.1_aarch64.tbz2
	cd $SRC_DIR/Downloads/Linux_for_Tegra/rootfs/
	tar xvf $SRC_DIR/Downloads/Jetson-Nano-Tegra_Linux_Sample-Root-Filesystem_R32.2.1_aarch64.tbz2
	cd $SRC_DIR/Downloads/Linux_for_Tegra/
	cp $SRC_DIR/Downloads/Linux_for_Tegra/kernel/dtb/tegra210-p3448-0000-p3449-0000-a02.dtb $SRC_DIR/backup/
	dtc -I dtb -O dts -o $SRC_DIR/backup/tegra210-p3448-0000-p3449-0000-a02.dts $SRC_DIR/backup/tegra210-p3448-0000-p3449-0000-a02.dtb
	grep -q 'nvidia,dtbbuildtime = "Aug 12 2019", "21:21:24"' $SRC_DIR/backup/tegra210-p3448-0000-p3449-0000-a02.dts && echo Device-Tree version mach || { echo Device-Tree version miss-mach; exit 1; }
	dtc -I dts -O dtb -o $SRC_DIR/tegra210-p3448-0000-p3449-0000-a02.dtb $SRC_DIR/tegra210-p3448-0000-p3449-0000-a02.dts
	cp $SRC_DIR/tegra210-p3448-0000-p3449-0000-a02.dtb $SRC_DIR/Downloads/Linux_for_Tegra/kernel/dtb/tegra210-p3448-0000-p3449-0000-a02.dtb
	wget -c https://github.com/Tiryoh/tegra_u-boot/releases/download/tegra-l4t-r32.2.1-spi1/u-boot.bin -O $SRC_DIR/Downloads/u-boot.bin
	cp $SRC_DIR/Downloads/u-boot.bin $SRC_DIR/Downloads/Linux_for_Tegra/bootloader/t210ref/p3450-porg/u-boot.bin
	wget -c https://raw.githubusercontent.com/gtjoseph/jetson-nano-support/585d634cf5c989242460352640c0c462e7be9e3f/flash/flash-partitions.sh -O $SRC_DIR/Downloads/Linux_for_Tegra/flash-partitions.sh
	chmod +x $SRC_DIR/Downloads/Linux_for_Tegra/flash-partitions.sh
	wget -c https://raw.githubusercontent.com/gtjoseph/jetson-nano-support/585d634cf5c989242460352640c0c462e7be9e3f/flash/flash2.sh -O $SRC_DIR/Downloads/Linux_for_Tegra/flash2.sh
	chmod +x $SRC_DIR/Downloads/Linux_for_Tegra/flash2.sh
	sudo chown root:root -R $SRC_DIR/Downloads/Linux_for_Tegra
fi

read -n1 -p "Turn your Jetson Nano into Recovery Mode. Are you ready?[y/n] " yn; [[ $yn = [yY] ]] || { echo abort.; exit 1; }
cd $SRC_DIR/Downloads/Linux_for_Tegra/
sudo ./apply_binaries.sh
sudo ./flash-partitions.sh --partitions=EBT,RP1,LNX,DTB jetson-nano-qspi-sd mmcblk0p1
