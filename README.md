# JetsonNano_DT_SPI

unofficial script for Jetson Nano(L4T Jetson-Nano-Tegra210_Linux_R32.1.0_aarch64) to enable SPI1

First, downloading this repository into your Ubuntu PC (not your Jetson Nano).
After downloading, just run:

```sh
./run.sh
```

## Acknowledgment

special thanks to [jas-mx](https://devtalk.nvidia.com/member/3084736/):

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
