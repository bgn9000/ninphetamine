#!/bin/sh
export KERNELDIR=`readlink -f .`
export PARENT_DIR=`readlink -f ..`

export ARCH=arm

#export CONFIG_CC_OPTIMIZE_FOR_SPEED=1
# GCC 4.5.2
#export CROSS_COMPILE=$PARENT_DIR/arm-2011/bin_452/arm-none-linux-gnueabi-
export CONFIG_CC_OPTIMIZE_FOR_FAST=1
# GCC 4.6.3
export CROSS_COMPILE=$PARENT_DIR/arm-2012/bin_463/arm-linux-gnueabi-

if [ ! -f $KERNELDIR/.config ];
then
	if [ "${1}" == "ATT" ];then
	  make V=1 bgn9000_att_defconfig
	elif [ "${1}" == "NTT" ];then
	  make V=1 bgn9000_ntt_defconfig
	else
	  make V=1 bgn9000_defconfig
	fi
fi
