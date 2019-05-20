# JetsonNano_DT_SPI

unofficial script for Jetson Nano(L4T Jetson-Nano-Tegra210_Linux_R32.1.0_aarch64) to enable SPI1

First, downloading this repository into your Ubuntu PC (not your Jetson Nano).  
After downloading, just run:

```sh
./run.sh
```

## Infomation

The difference between original and modified `tegra210-p3448-0002-p3449-0000-a02.dts`:  
https://github.com/rt-net/JetsonNano_DT_SPI/commit/79d4698ac518ab4cc9662ae8bd7e282f56f31cab

このツールの詳細については以下の記事で紹介しています。  
The details of this tools are written in Japanese on this page:  
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
