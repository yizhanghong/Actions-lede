#!/bin/bash

#删除feeds中的插件
# rm -rf ./feeds/ssrp/ipt2socks
# rm -rf ./feeds/ssrp/hysteria
# rm -rf ./feeds/ssrp/v2ray-plugin
# rm -rf ./feeds/ssrp/chinadns-ng
# rm -rf ./feeds/ssrp/dns2tcp
# rm -rf ./feeds/ssrp/naiveproxy
# rm -rf ./feeds/ssrp/shadowsocksr-libev
# rm -rf ./feeds/ssrp/v2ray-plugin
# rm -rf ./feeds/packages/net/smartdns
rm -rf ./feeds/packages/net/chinadns-ng
rm -rf ./feeds/packages/net/sing-box
rm -rf ./feeds/packages/net/xray-core
# rm -rf ./feeds/luci/applications/luci-app-mosdns
# rm -rf ./feeds/luci/applications/luci-app-smartdns
rm -rf ./feeds/luci/applications/luci-app-passwall
rm -rf ./feeds/luci/applications/luci-app-passwall2


#克隆插件
git clone https://github.com/xiaorouji/openwrt-passwall-packages.git package/pwpage

#升级golang
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 24.x feeds/packages/lang/golang

# 5g支持 
git clone --depth=1 https://github.com/Siriling/5G-Modem-Support Modem-Support
# 5G通信模组拨号工具
mkdir package/community
mkdir package/community/quectel_QMI_WWAN
mkdir package/community/quectel_cm_5G
mkdir package/community/quectel_MHI
mkdir package/community/luci-app-hypermodem        
mkdir package/community/sms-tool
mkdir package/community/luci-app-sms-tool
cp -rf ./Modem-Support/quectel_QMI_WWAN/* package/community/quectel_QMI_WWAN
cp -rf ./Modem-Support/quectel_cm_5G/* package/community/quectel_cm_5G
cp -rf ./Modem-Support/quectel_MHI/* package/community/quectel_MHI
cp -rf ./Modem-Support/luci-app-hypermodem/* package/community/luci-app-hypermodem
cp -rf ./Modem-Support/sms-tool/* package/community/sms-tool
cp -rf ./Modem-Support/luci-app-sms-tool/* package/community/luci-app-sms-tool
#5G相关
echo "
# 5G模组信号插件
# CONFIG_PACKAGE_ext-rooter-basic=y
        
# 5G模组短信插件
CONFIG_PACKAGE_luci-app-sms-tool=y
        
# 5G模组信息插件
# CONFIG_PACKAGE_luci-app-3ginfo-lite=y
# CONFIG_PACKAGE_luci-app-3ginfo=y
        
# 5G模组信息插件+AT工具
# CONFIG_PACKAGE_luci-app-cpe=y
# CONFIG_PACKAGE_sendat=y
CONFIG_PACKAGE_sms-tool=y
#CONFIG_PACKAGE_luci-app-modem=y
        
# QMI拨号工具（移远，广和通）
# CONFIG_PACKAGE_quectel-CM-5G=y
# CONFIG_PACKAGE_fibocom-dial=y
        
# QMI拨号软件
# CONFIG_PACKAGE_kmod-qmi_wwan_f=y
# CONFIG_PACKAGE_luci-app-hypermodem=y
        
# Gobinet拨号软件
# CONFIG_PACKAGE_kmod-gobinet=y
# CONFIG_PACKAGE_luci-app-gobinetmodem=y
        
# 串口调试工具
CONFIG_PACKAGE_minicom=y
        
# 脚本拨号工具依赖
CONFIG_PACKAGE_procps-ng=y
CONFIG_PACKAGE_procps-ng-ps=y
# usb隐藏
CONFIG_PACKAGE_kmod-usb-hid=y
" >> .config

mkdir package/small
pushd package/small
#adguardhome
# git clone -b 2023.10 --depth 1 https://github.com/XiaoBinin/luci-app-adguardhome.git
#lucky
# git clone -b main --depth 1 https://github.com/sirpdboy/luci-app-lucky.git
#smartdns
# git clone -b lede --depth 1 https://github.com/pymumu/luci-app-smartdns.git
# git clone -b master --depth 1 https://github.com/pymumu/smartdns.git
#ssrp
# git clone -b master --depth 1 https://github.com/fw876/helloworld.git
#passwall
git clone -b main --depth 1 https://github.com/xiaorouji/openwrt-passwall.git
#passwall2
git clone -b main --depth 1 https://github.com/xiaorouji/openwrt-passwall2.git
#mosdns
# git clone -b v5 --depth 1 https://github.com/sbwml/luci-app-mosdns.git
#openclash
# git clone -b master --depth 1 https://github.com/vernesong/OpenClash.git
#modem
git clone -b main --depth 1 https://github.com/FUjr/modem_feeds.git

popd

echo "packages executed successfully!"
