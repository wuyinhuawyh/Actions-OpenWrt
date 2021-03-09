# 管理地址
sed -i 's/192.168.1.1/192.168.199.1/g' package/base-files/files/bin/config_generate

# 默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 固件架构
cat >> .config <<EOF
CONFIG_TARGET_ipq40xx=y
CONFIG_TARGET_ipq40xx_DEVICE_hiwifi_c526a=y
EOF

# 禁用 IPV6
cat >> .config <<EOF
# CONFIG_IPV6 is not set
EOF

# 取消默认启用的包
cat >> .config <<EOF
CONFIG_PACKAGE_luci-app-nlbwmon=y
CONFIG_PACKAGE_luci-app-adbyby-plus=y
CONFIG_PACKAGE_luci-app-aria2=y
CONFIG_PACKAGE_luci-app-ttyd=y
CONFIG_PACKAGE_luci-app-zerotier=y
CONFIG_PACKAGE_luci-app-vlmcsd=y
CONFIG_PACKAGE_luci-app-unblockmusic=y
CONFIG_PACKAGE_luci-app-statistics=y
CONFIG_PACKAGE_luci-app-ramfree=y
CONFIG_PACKAGE_luci-app-netdata=y
CONFIG_PACKAGE_luci-app-kodexplorer=y
CONFIG_PACKAGE_luci-app-familycloud=y
CONFIG_PACKAGE_luci-app-ddns=y
CONFIG_PACKAGE_luci-app-adbyby-plus=y
CONFIG_PACKAGE_luci-app-filetransfer=y
CONFIG_PACKAGE_luci-app-vsftpd=y
CONFIG_PACKAGE_luci-app-ssr-plus=y
CONFIG_PACKAGE_luci-app-arpbind=y
CONFIG_PACKAGE_luci-app-vlmcsd=y
CONFIG_PACKAGE_luci-app-wol=y
CONFIG_PACKAGE_luci-app-accesscontrol=y
CONFIG_PACKAGE_luci-app-cpufreq=y
CONFIG_PACKAGE_luci-app-ipsec-vpnd=y
CONFIG_PACKAGE_v2ray=y
CONFIG_PACKAGE_ddns-scripts_aliyun=y
CONFIG_PACKAGE_ddns-scripts_dnspod=y
CONFIG_PACKAGE_luci-app-openclash=y
CONFIG_PACKAGE_luci-app-frpc=y
CONFIG_PACKAGE_luci-app-guest-wifi=y
EOF

# 其它默认的包 luci luci-app-upnp luci-app-nlbwmon luci-app-samba autosamba automount default-settings

# 基本软件:
cat >> .config <<EOF
CONFIG_PACKAGE_bash=y
CONFIG_PACKAGE_nano=y
CONFIG_PACKAGE_wget=y
CONFIG_PACKAGE_curl=y
CONFIG_PACKAGE_unzip=y
CONFIG_PACKAGE_screen=y
CONFIG_PACKAGE_autocore-arm=y
EOF

# FFmpeg
cat >> .config <<EOF
CONFIG_PACKAGE_libopus=y
CONFIG_PACKAGE_libx264=y
CONFIG_PACKAGE_ffmpeg=y
CONFIG_PACKAGE_ffprobe=y
EOF

# 常用软件 默认已启用
#cat >> .config <<EOF
#CONFIG_PACKAGE_luci=y
#CONFIG_PACKAGE_luci-app-upnp=y
#CONFIG_PACKAGE_luci-app-nlbwmon=y
#CONFIG_PACKAGE_luci-app-samba=y
#CONFIG_PACKAGE_autosamba=y
#CONFIG_PACKAGE_default-settings=y
#EOF

# 其它
sed -i '21d' package/lean/default-settings/files/zzz-default-settings #禁止网络共享分类到NAS
