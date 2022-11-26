#!/bin/bash
#=================================================
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: 2AYN
#=================================================
#  ____     _ __   ___   _ 
# |___ \   / \\ \ / / \ | |
#   __) | / _ \\ V /|  \| |
#  / __/ / ___ \| | | |\  |
# |_____/_/   \_\_| |_| \_|
                         
 

# 修改ETH0默认为WAN口，ETH1默认为LAN口
sed -i 11s/'eth0'/'eth1'/ package/base-files/files/etc/board.d/99-default_network
sed -i 12s/\'eth1\'/\'eth0\'/ package/base-files/files/etc/board.d/99-default_network

# 修改默认IP
sed -i 's/192.168.1.1/10.10.10.1/g' package/base-files/files/bin/config_generate

# 删除默认密码
sed -i "/CYXluq4wUazHjmCDBCqXF/d" package/lean/default-settings/files/zzz-default-settings

# 取消bootstrap为默认主题
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
