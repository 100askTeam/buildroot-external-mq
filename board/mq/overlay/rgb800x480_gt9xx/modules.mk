#
# Copyright (C) 2015-2016 Allwinner
#
# This is free software, licensed under the GNU General Public License v2.
# See /build/LICENSE for more information.
#
define KernelPackage/sunxi-vin
  SUBMENU:=$(VIDEO_MENU)
  TITLE:=sunxi-vin support
  FILES:=$(LINUX_DIR)/drivers/media/common/videobuf2/videobuf2-memops.ko
  FILES+=$(LINUX_DIR)/drivers/media/common/videobuf2/videobuf2-dma-contig.ko
  FILES+=$(LINUX_DIR)/drivers/media/platform/sunxi-vin/vin_io.ko
  FILES+=$(LINUX_DIR)/drivers/media/platform/sunxi-vin/modules/sensor/ov5640.ko
  FILES+=$(LINUX_DIR)/drivers/media/platform/sunxi-vin/vin_v4l2.ko
  KCONFIG:=\
    CONFIG_V4L_PLATFORM_DRIVERS=y \
	CONFIG_SUNXI_PLATFORM_DRIVERS=y \
    CONFIG_VIDEO_SUNXI_VIN \
    CONFIG_CSI_VIN=m \
	CONFIG_CSI_CCI=n \
	CONFIG_I2C_SUNXI=y
  AUTOLOAD:=$(call AutoLoad,90,videobuf2-memops videobuf2-dma-contig vin_io ov5640 vin_v4l2)
endef

define KernelPackage/sunxi-vin/description
  Kernel modules for sunxi-vin support
endef

$(eval $(call KernelPackage,sunxi-vin))

define KernelPackage/sunxi-uvc
  SUBMENU:=$(VIDEO_MENU)
  TITLE:=sunxi-uvc support
  FILES:=$(LINUX_DIR)/drivers/media/common/videobuf2/videobuf2-common.ko
  FILES+=$(LINUX_DIR)/drivers/media/common/videobuf2/videobuf2-v4l2.ko
  FILES+=$(LINUX_DIR)/drivers/media/common/videobuf2/videobuf2-memops.ko
  FILES+=$(LINUX_DIR)/drivers/media/common/videobuf2/videobuf2-vmalloc.ko
  FILES+=$(LINUX_DIR)/drivers/media/usb/uvc/uvcvideo.ko
  KCONFIG:= \
    CONFIG_MEDIA_USB_SUPPORT=y \
    CONFIG_USB_VIDEO_CLASS \
    CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV
  AUTOLOAD:=$(call AutoLoad,95,videobuf2-common videobuf2-v4l2 videobuf2-memops videobuf2_vmalloc uvcvideo)
endef

define KernelPackage/sunxi-uvc/description
  Kernel modules for sunxi-uvc support
endef

$(eval $(call KernelPackage,sunxi-uvc))

define KernelPackage/net-broadcom
  SUBMENU:=$(WIRELESS_MENU)
  DEPENDS:= +ap6256-firmware +@PACKAGE_broadcom-rftest
  TITLE:=broadcom(ap6256...) support
  FILES:=$(LINUX_DIR)/drivers/net/wireless/bcmdhd/bcmdhd.ko
  KCONFIG:=\
	  CONFIG_BCMDHD=m \
	  CONFIG_BCMDHD_SDIO=y \
	  CONFIG_BCMDHD_OOB=y \
	  CONFIG_BCMDHD_FW_PATH="/etc/firmware/fw_bcmdhd.bin" \
	  CONFIG_BCMDHD_NVRAM_PATH="/etc/firmware/nvram.txt" \
	  CONFIG_BCMDHD_SDIO=y \
	  CONFIG_SUNXI_RFKILL=y \
	  CONFIG_MMC=y \
	  CONFIG_PWRSEQ_EMMC=y \
	  CONFIG_PWRSEQ_SIMPLE=y \
	  CONFIG_MMC_SUNXI=y \
	  CONFIG_MMC_SUNXI_V4P1X=y \
	  CONFIG_MMC_SUNXI_V4P00X=y \
	  CONFIG_MMC_SUNXI_V4P10X=y \
	  CONFIG_MMC_SUNXI_V4P5X=y \
	  CONFIG_MMC_SUNXI_V5P3X=y \

  AUTOLOAD:=$(call AutoProbe,bcmdhd,1)
endef

define KernelPackage/net-broadcom/description
 Kernel modules for Broadcom AP6256...  support
endef

$(eval $(call KernelPackage,net-broadcom))

define KernelPackage/net-xr829-40M
  SUBMENU:=$(WIRELESS_MENU)
  TITLE:=xr829 support (staging)
  DEPENDS:= +xr829-firmware +@IPV6 +@XR829_USE_40M_SDD +@USES_XRADIO +@PACKAGE_xr829-rftest
  KCONFIG:=\
	CONFIG_XR829_WLAN=m \
	CONFIG_PM=y\
	CONFIG_BT=y \
	CONFIG_BT_BREDR=y \
	CONFIG_BT_RFCOMM=y \
	CONFIG_BT_RFCOMM_TTY=y \
	CONFIG_BT_DEBUGFS=y \
	CONFIG_XR_BT_LPM=y \
	CONFIG_XR_BT_FDI=y \
	CONFIG_BT_HCIUART=y \
	CONFIG_BT_HCIUART_H4=y \
	CONFIG_HFP_OVER_PCM=y \
	CONFIG_RFKILL=y \
	CONFIG_RFKILL_PM=y \
	CONFIG_RFKILL_GPIO=y

  #FILES:=$(LINUX_DIR)/drivers/net/wireless/xr829/wlan/xradio_core.ko
  #FILES+=$(LINUX_DIR)/drivers/net/wireless/xr829/wlan/xradio_wlan.ko
  #FILES+=$(LINUX_DIR)/drivers/net/wireless/xr829/umac/xradio_mac.ko
  #AUTOLOAD:=$(call AutoProbe, xradio_mac xradio_core xradio_wlan)

  FILES:=$(LINUX_DIR)/drivers/net/wireless/xr829/xr829.ko
  AUTOLOAD:=$(call AutoProbe, xr829)
endef

define KernelPackage/net-xr829-40M/description
 Kernel modules for xr829 support
endef

$(eval $(call KernelPackage,net-xr829-40M))


define KernelPackage/net-xr829
  SUBMENU:=$(WIRELESS_MENU)
  TITLE:=xr829 support (staging)
  DEPENDS:= +xr829-firmware +@IPV6 +@USES_XRADIO +@PACKAGE_xr829-rftest +@PACKAGE_xr829-rftest
  KCONFIG:=\
	CONFIG_XR829_WLAN=m \
	CONFIG_PM=y\
	CONFIG_BT=y \
	CONFIG_BT_BREDR=y \
	CONFIG_BT_RFCOMM=y \
	CONFIG_BT_RFCOMM_TTY=y \
	CONFIG_BT_DEBUGFS=y \
	CONFIG_XR_BT_LPM=y \
	CONFIG_XR_BT_FDI=y \
	CONFIG_BT_HCIUART=y \
	CONFIG_BT_HCIUART_H4=y \
	CONFIG_HFP_OVER_PCM=y \
	CONFIG_RFKILL=y \
	CONFIG_RFKILL_PM=y \
	CONFIG_RFKILL_GPIO=y

  #FILES:=$(LINUX_DIR)/drivers/net/wireless/xr829/wlan/xradio_core.ko
  #FILES+=$(LINUX_DIR)/drivers/net/wireless/xr829/wlan/xradio_wlan.ko
  #FILES+=$(LINUX_DIR)/drivers/net/wireless/xr829/umac/xradio_mac.ko
  #AUTOLOAD:=$(call AutoProbe, xradio_mac xradio_core xradio_wlan)

  FILES+=$(LINUX_DIR)/drivers/net/wireless/xr829/xr829.ko
  AUTOLOAD:=$(call AutoProbe, xr829)
endef

define KernelPackage/net-xr829/description
 Kernel modules for xr829 support
endef

$(eval $(call KernelPackage,net-xr829))

define KernelPackage/net-rtl8723ds
  SUBMENU:=$(WIRELESS_MENU)
  DEPENDS:= +@DRIVER_WEXT_SUPPORT
  TITLE:=RTL8723DS support (staging) 
#  KCONFIG:=\
#	CONFIG_RFKILL=y \
#	CONFIG_SUNXI_RFKILL=y \
#	CONFIG_RFKILL_PM=y \
#	CONFIG_RFKILL_GPIO=y
  FILES:=$(LINUX_DIR)/drivers/net/wireless/rtl8723ds/8723ds.ko
  AUTOLOAD:=$(call AutoProbe,8723ds)
endef

define KernelPackage/net-rtl8723ds/description  
 Kernel modules for RealTek RTL8723DS support
endef

$(eval $(call KernelPackage,net-rtl8723ds))






define KernelPackage/net-rtl8189es
  SUBMENU:=$(WIRELESS_MENU)
  DEPENDS:= +@DRIVER_WEXT_SUPPORT
  TITLE:=RTL8189ES support (staging)
#  KCONFIG:=\
#       CONFIG_RFKILL=y \
#       CONFIG_SUNXI_RFKILL=y \
#       CONFIG_RFKILL_PM=y \
#       CONFIG_RFKILL_GPIO=y
  FILES:=$(LINUX_DIR)/drivers/net/wireless/rtl8189es/8189es.ko
  AUTOLOAD:=$(call AutoProbe,8189es)
endef

define KernelPackage/net-rtl8189es/description
 Kernel modules for RealTek RTL8189ES support
endef

$(eval $(call KernelPackage,net-rtl8189es))








define KernelPackage/net-rtl8189fs
  SUBMENU:=$(WIRELESS_MENU)
  DEPENDS:= +@DRIVER_WEXT_SUPPORT
  TITLE:=RTL8189FS support (staging)
#  KCONFIG:=\
#       CONFIG_RFKILL=y \
#       CONFIG_SUNXI_RFKILL=y \
#       CONFIG_RFKILL_PM=y \
#       CONFIG_RFKILL_GPIO=y
  FILES:=$(LINUX_DIR)/drivers/net/wireless/rtl8189fs/8189fs.ko
  AUTOLOAD:=$(call AutoProbe,8189fs)
endef

define KernelPackage/net-rtl8189fs/description
 Kernel modules for RealTek RTL8189FS support
endef

$(eval $(call KernelPackage,net-rtl8189fs))




define KernelPackage/net-rtl8821cs
  SUBMENU:=$(WIRELESS_MENU)
  TITLE:=RTL8821CS support (staging)
  DEPENDS:= +rtl8821cs-firmware +@IPV6
  FILES:=$(LINUX_DIR)/drivers/net/wireless/rtl8821cs/8821cs.ko
  AUTOLOAD:=$(call AutoProbe,8821cs)
endef

define KernelPackage/net-rtl8821cs/description
 Kernel modules for RealTek RTL8821CS support
endef

$(eval $(call KernelPackage,net-rtl8821cs))

define KernelPackage/sunxi-disp
  SUBMENU:=$(VIDEO_MENU)
  TITLE:=sunxi-disp support
  KCONFIG:=\
	  CONFIG_DISP2_SUNXI=m \
	  CONFIG_SUNXI_DISP2_FB_DISABLE_ROTATE=y \
	  CONFIG_SUNXI_DISP2_FB_ROTATION_SUPPORT=n \
	  CONFIG_SUNXI_DISP2_FB_HW_ROTATION_SUPPORT=n \
	  CONFIG_DISP2_SUNXI_BOOT_COLORBAR=n \
	  CONFIG_DISP2_SUNXI_DEBUG=y \
	  CONFIG_DISP2_SUNXI_COMPOSER=n \
	  CONFIG_DISP2_SUNXI_SUPPORT_SMBL=y \
	  CONFIG_DISP2_SUNXI_SUPPORT_ENAHNCE=y \
	  CONFIG_SUNXI_DISP2_FB_DECOMPRESS_LZMA=n \
	  CONFIG_VDPO_DISP2_SUNXI=n \
	  CONFIG_EDP_DISP2_SUNXI=n \
	  CONFIG_HDMI_DISP2_SUNXI=n \
	  CONFIG_HDMI2_DISP2_SUNXI=n \
	  CONFIG_HDMI_EP952_DISP2_SUNXI=n \
	  CONFIG_TV_DISP2_SUNXI=n \
	  CONFIG_DISP2_LCD_ESD_DETECT=n \
	  CONFIG_LCD_FB=n \
	  CONFIG_LCD_FB_ENABLE_DEFERRED_IO=n \
	  CONFIG_FB=y \
	  CONFIG_FB_CMDLINE=y \
	  CONFIG_FB_CONSOLE_SUNXI=n \
	  CONFIG_FRAMEBUFFER_CONSOLE=n \
	  CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=n \
	  CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=n \
	  CONFIG_LCD_SUPPORT_GG1P4062UTSW=n \
	  CONFIG_LCD_SUPPORT_DX0960BE40A1=n \
	  CONFIG_LCD_SUPPORT_TFT720X1280=n \
	  CONFIG_LCD_SUPPORT_FD055HD003S=n \
	  CONFIG_LCD_SUPPORT_HE0801A068=n \
	  CONFIG_LCD_SUPPORT_ILI9341=n \
	  CONFIG_LCD_SUPPORT_LH219WQ1=n \
	  CONFIG_LCD_SUPPORT_LS029B3SX02=n \
	  CONFIG_LCD_SUPPORT_LT070ME05000=n \
	  CONFIG_LCD_SUPPORT_S6D7AA0X01=n \
	  CONFIG_LCD_SUPPORT_T27P06=n \
	  CONFIG_LCD_SUPPORT_TFT720x1280=n \
	  CONFIG_LCD_SUPPORT_WTQ05027D01=n \
	  CONFIG_LCD_SUPPORT_H245QBN02=n \
	  CONFIG_LCD_SUPPORT_ST7789V=n \
	  CONFIG_LCD_SUPPORT_ST7796S=n \
	  CONFIG_LCD_SUPPORT_ST7701S=n \
	  CONFIG_LCD_SUPPORT_T30P106=n \
	  CONFIG_LCD_SUPPORT_TO20T20000=n \
	  CONFIG_LCD_SUPPORT_FRD450H40014=n \
	  CONFIG_LCD_SUPPORT_S2003T46G=n \
	  CONFIG_LCD_SUPPORT_WILLIAMLCD=n \
	  CONFIG_LCD_SUPPORT_LQ101R1SX03=n \
	  CONFIG_LCD_SUPPORT_INET_DSI_PANEL=n \
	  CONFIG_LCD_SUPPORT_WTL096601G03=n \
	  CONFIG_LCD_SUPPORT_RT13QV005D=n \
	  CONFIG_LCD_SUPPORT_ST7789V_CPU=n \
	  CONFIG_LCD_SUPPORT_CC08021801_310_800X1280=n \
	  CONFIG_LCD_SUPPORT_JD9366AB_3=n \
	  CONFIG_LCD_SUPPORT_TFT08006=y \
	  CONFIG_DRM=n
  FILES+=$(LINUX_DIR)/drivers/video/fbdev/sunxi/disp2/disp/disp.ko
  AUTOLOAD:=$(call AutoLoad,10,disp,1)
endef

define KernelPackage/sunxi-disp/description
  Kernel modules for sunxi-disp support
endef

$(eval $(call KernelPackage,sunxi-disp))

define KernelPackage/sunxi-hdmi
  SUBMENU:=$(VIDEO_MENU)
  TITLE:=sunxi-hdmi support
  DEPENDS:=+kmod-sunxi-disp
  KCONFIG:=\
	  CONFIG_HDMI2_DISP2_SUNXI=m \
	  CONFIG_AW_PHY=y \
	  CONFIG_DEFAULT_PHY=n \
	  CONFIG_HDMI2_HDCP_SUNXI=y \
	  CONFIG_HDMI2_HDCP22_SUNXI=n \
	  CONFIG_HDMI2_CEC_SUNXI=y \
	  CONFIG_HDMI2_CEC_USER=n \
	  CONFIG_HDMI2_FREQ_SPREAD_SPECTRUM=n
  FILES+=$(LINUX_DIR)/drivers/video/fbdev/sunxi/disp2/hdmi2/hdmi20.ko
  AUTOLOAD:=$(call AutoLoad,15,hdmi20,1)
endef

define KernelPackage/sunxi-hdmi/description
  Kernel modules for sunxi-hdmi support
endef

$(eval $(call KernelPackage,sunxi-hdmi))

define KernelPackage/sunxi-g2d
  SUBMENU:=$(VIDEO_MENU)
  TITLE:=sunxi-g2d support
  KCONFIG:=\
	  CONFIG_SUNXI_G2D=y \
	  CONFIG_SUNXI_G2D_MIXER=y \
	  CONFIG_SUNXI_G2D_ROTATE=y \
	  CONFIG_SUNXI_SYNCFENCE=n
  FILES+=$(LINUX_DIR)/drivers/char/sunxi_g2d/g2d_sunxi.ko
  AUTOLOAD:=$(call AutoLoad,20,g2d_sunxi,1)
endef

define KernelPackage/sunxi-g2d/description
  Kernel modules for sunxi-g2d support
endef

$(eval $(call KernelPackage,sunxi-g2d))

define KernelPackage/touchscreen-gt9xxnew
  SUBMENU:=$(INPUT_MODULES_MENU)
  TITLE:=gt9xxnew support
  DEPENDS:= +kmod-input-core
  KCONFIG:= \
	CONFIG_INPUT_TOUCHSCREEN=y \
	CONFIG_INPUT_SENSORINIT=y \
	CONFIG_I2C_SUNXI=y \
	CONFIG_TOUCHSCREEN_BU21029=n \
	CONFIG_TOUCHSCREEN_EGALAX_SERIAL=n \
	CONFIG_TOUCHSCREEN_EXC3000=n \
	CONFIG_TOUCHSCREEN_HIDEEP=n \
	CONFIG_TOUCHSCREEN_S6SY761=n \
	CONFIG_TOUCHSCREEN_EKTF2127=n \
	CONFIG_TOUCHSCREEN_MELFAS_MIP4=n \
	CONFIG_TOUCHSCREEN_RM_TS=n \
	CONFIG_TOUCHSCREEN_SILEAD=n \
	CONFIG_TOUCHSCREEN_SIS_I2C=n \
	CONFIG_TOUCHSCREEN_STMFTS=n \
	CONFIG_TOUCHSCREEN_SUN4I=n \
	CONFIG_TOUCHSCREEN_SURFACE3_SPI=n \
	CONFIG_TOUCHSCREEN_ZET6223=n \
	CONFIG_TOUCHSCREEN_IQS5XX=n \
	CONFIG_TOUCHSCREEN_GT9XXNEW_TS=m \
	CONFIG_TOUCHSCREEN_GT9XXNEWDUP_TS=n
  FILES:=$(LINUX_DIR)/drivers/input/touchscreen/gt9xxnew/gt9xxnew_ts.ko
  AUTOLOAD:=$(call AutoProbe,gt9xxnew_ts)
endef


define KernelPackage/touchscreen-gt9xxnew/description
 Enable support for gt9xxnew touchscreen port.
endef

$(eval $(call KernelPackage,touchscreen-gt9xxnew))
