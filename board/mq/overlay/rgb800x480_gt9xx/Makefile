#
# Copyright (C) 2013-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

ARCH:=riscv
BOARD:=d1-mangopi_mq_rgb800x480_gt9xx
BOARDNAME:=d1-mangopi_mq_rgb800x480_gt9xx
FEATURES:=
CPU_TYPE:=c910
CPU_SUBTYPE:=rv64gcxthead
MAINTAINER:=Allwinner

KERNEL_PATCHVER:=5.4
UBOOT_PATCHVER:=2018
KERNELNAME:=Image dtbs

include $(BUILD_DIR)/target.mk

DEFAULT_PACKAGES +=
TARGET_CFLAGS += -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -DUSE_LOG_LIB_GLOG
TARGET_CXXFLAGS += -std=c++11 -fno-rtti

$(eval $(call BuildTarget))
