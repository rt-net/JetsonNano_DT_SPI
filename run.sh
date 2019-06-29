#!/usr/bin/env bash
set -eu

SRC_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

if [[ ! $(stat -c '%U' $SRC_DIR/Downloads/Linux_for_Tegra/ 2>/dev/null) == "root" ]]; then
	sudo apt install lbzip2 device-tree-compiler
	mkdir -p $SRC_DIR/Downloads/Linux_for_Tegra
	mkdir -p $SRC_DIR/backup
	cd $SRC_DIR/Downloads
	wget -c https://developer.nvidia.com/embedded/dlc/l4t-jetson-driver-package-32-1-jetson-nano -O Jetson-Nano-Tegra210_Linux_R32.1.0_aarch64.tbz2
	wget -c https://developer.nvidia.com/embedded/dlc/l4t-sample-root-filesystem-32-1-jetson-nano -O Jetson-Nano-Tegra_Linux_Sample-Root-Filesystem_R32.1.0_aarch64.tbz2
	md5sum -c $SRC_DIR/MD5SUM || { echo File download error.; exit 1; }
	tar xvf Jetson-Nano-Tegra210_Linux_R32.1.0_aarch64.tbz2
	cd $SRC_DIR/Downloads/Linux_for_Tegra/rootfs/
	tar xvf $SRC_DIR/Downloads/Jetson-Nano-Tegra_Linux_Sample-Root-Filesystem_R32.1.0_aarch64.tbz2
	cp $SRC_DIR/Downloads/Linux_for_Tegra/kernel/dtb/tegra210-p3448-0000-p3449-0000-a02.dtb $SRC_DIR/backup/
	dtc -I dtb -O dts -o $SRC_DIR/backup/tegra210-p3448-0000-p3449-0000-a02.dts $SRC_DIR/backup/tegra210-p3448-0000-p3449-0000-a02.dtb
	grep -q 'nvidia,dtbbuildtime = "Mar 13 2019", "00:37:56"' $SRC_DIR/backup/tegra210-p3448-0000-p3449-0000-a02.dts && echo Device-Tree version mach || { echo Device-Tree version miss-mach; exit 1; }
	dtc -I dts -O dtb -o $SRC_DIR/tegra210-p3448-0000-p3449-0000-a02.dtb $SRC_DIR/tegra210-p3448-0000-p3449-0000-a02.dts
	cp $SRC_DIR/tegra210-p3448-0000-p3449-0000-a02.dtb $SRC_DIR/Downloads/Linux_for_Tegra/kernel/dtb/tegra210-p3448-0000-p3449-0000-a02.dtb
	sudo chown root:root -R $SRC_DIR/Downloads/Linux_for_Tegra
fi

read -n1 -p "Turn your Jetson Nano into Recovery Mode. Are you ready?[y/n] " yn; [[ $yn = [yY] ]] || { echo abort.; exit 1; }
cd $SRC_DIR/Downloads/Linux_for_Tegra/
sudo ./apply_binaries.sh
sudo ./flash.sh --no-systemimg -k DTB jetson-nano-qspi-sd mmcblk0p1
