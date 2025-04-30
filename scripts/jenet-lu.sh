#!/bin/bash
#=================================================
# File name: jenet-lu.sh
# System Required: Linux
# Version: 1.0
# Lisence: MIT
# Author: SuLingGG
# Blog: https://mlapp.cn
#=================================================
echo '修改主机名'
sed -i "s/hostname='OpenWrt'/hostname='JENET'/g" ./package/base-files/files/bin/config_generate
echo '修改dts'
rm -rf target/linux/rockchip/files/arch/arm64/boot/dts/rockchip/rk3568-opc-h69k.dts
cp -f $GITHUB_WORKSPACE/configs/jenet-lu.dts target/linux/rockchip/files/arch/arm64/boot/dts/rockchip/rk3568-opc-h69k.dts

#添加qmodem
git clone --depth=1 -b main https://github.com/FUjr/QModem package/modem
echo "
CONFIG_PACKAGE_luci-i18n-qmodem-zh-cn=y
CONFIG_PACKAGE_luci-app-qmodem=y
CONFIG_PACKAGE_luci-app-qmodem_INCLUDE_vendor-qmi-wwan=y
# CONFIG_PACKAGE_luci-app-qmodem_INCLUDE_generic-qmi-wwan is not set
CONFIG_PACKAGE_luci-app-qmodem_USE_TOM_CUSTOMIZED_QUECTEL_CM=y
# CONFIG_PACKAGE_luci-app-qmodem_USING_QWRT_QUECTEL_CM_5G is not set
# CONFIG_PACKAGE_luci-app-qmodem_USING_NORMAL_QUECTEL_CM is not set
# CONFIG_PACKAGE_luci-app-qmodem_INCLUDE_ADD_PCI_SUPPORT is not set
# CONFIG_PACKAGE_luci-app-qmodem_INCLUDE_ADD_QFIREHOSE_SUPPORT is not set
CONFIG_PACKAGE_luci-app-qmodem-hc=y
CONFIG_PACKAGE_luci-app-qmodem-mwan=y
CONFIG_PACKAGE_luci-app-qmodem-sms=y
CONFIG_PACKAGE_luci-app-qmodem-ttl=y
" > .config
./scripts/feeds install -a
