# JetsonNano_DT_SPI

unofficial script for Jetson Nano(L4T Jetson-Nano-Tegra210_Linux_R32.1.0_aarch64) to enable SPI0 (SPI1 on Developer Kit's Pin 19, 21, 23 and 24)

__Please don't forget to backup your data!__  
__This script is tested only on L4T R32.1(not tested on > R32.1).  Details: [issue#5](https://github.com/rt-net/JetsonNano_DT_SPI/issues/5).__

First, download this repository into your Ubuntu PC (not your Jetson Nano).  
After downloading, just run:

```sh
./run.sh
```

The scripts shows the following after flashing.

```sh
*** The [DTB] has been updated successfully. ***
```

## Usage

The script doesn't depend on the NVIDIA SDK Manager. It downloads the reqirements from the NVIDIA's server by itself.  You don't have to install the NVIDIA SDK Manager to use this script.

1. Setup the Jetson Nano to be able to boot
2. Turn the Jetson Nano into Recovery Mode
3. Connect the Jetson Nano and the Linux PC with a USB cable
4. Download [`rt-net/JetsonNano_DT_SPI`](https://github.com/rt-net/JetsonNano_DT_SPI) into the Linux PC (__not Jetson Nano__)
    * `git clone https://github.com/rt-net/JetsonNano_DT_SPI`
5. Run [`run.sh`](https://github.com/rt-net/JetsonNano_DT_SPI/blob/master/run.sh) and confirm that the file has flashed successfully
    * `./run.sh`

## Information

The difference between original and modified `tegra210-p3448-0002-p3449-0000-a02.dts`:  
* https://github.com/rt-net/JetsonNano_DT_SPI/commit/79d4698ac518ab4cc9662ae8bd7e282f56f31cab
* https://github.com/rt-net/JetsonNano_DT_SPI/commit/0124b15ea6e29a0a45246223b7c892aa39e20678

SPI1 on J40 of Developer Kit is available from `/dev/spidev0.0`.
Accroding to "[Jetson Nano Product Design Guide](https://developer.nvidia.com/embedded/dlc/jetson-nano-product-design-guide)" which was published on June 10th, 2019, SPI1(Pin 19, 21, 23 and 24 on Developer Kit) is connected to SPI0 on Tegra X1, not SPI1.  See section "9.2 SPI"(pp. 41).

このツールの詳細については以下の記事で紹介しています。  
The details of these tools are written in Japanese on this page:  
https://www.rt-shop.jp/blog/archives/11277

## Acknowledgments

### Special Thanks

This work was derived from [jas-mx](https://devtalk.nvidia.com/member/3084736/)'s information:

https://devtalk.nvidia.com/default/topic/1050427/jetson-nano/enabling-spidev-on-the-jetson-nano-is-hanging-when-flashing/post/5338398/#5338398

### tegra210-p3448-0002-p3449-0000-a02.dts

```
/*
 * arch/arm64/boot/dts/tegra210-p3448-0002-p3449-0000-a02.dts
 *
 * Copyright (c) 2018-2019, NVIDIA CORPORATION.  All rights reserved.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 2 of the License.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 *
 */
```

## License

This repository is released under the GNU General Public License v2.0 because it includes the device tree source released under the GNU General Public License v2.0.
