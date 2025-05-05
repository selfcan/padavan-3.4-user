#!/bin/sh

self_name="Entware"

# check /opt mounted
if ! grep -q /opt /proc/mounts ; then
	echo "ERROR! Directory \"/opt\" not mounted!"
	exit 1
fi

# extend path to /opt
export PATH=/opt/sbin:/opt/bin:/usr/sbin:/usr/bin:/sbin:/bin
INSTALLER=/tmp/entware_installer.sh

# check opkg installed
if [ ! -f /opt/bin/opkg ] ; then
	logger -t "${self_name}" "开始下载 entware opkg...."
	wget -q http://bin.entware.net/mipselsf-k3.4/installer/generic.sh -O $INSTALLER
	if [ $? -eq 0 ] ; then
		logger -t "${self_name}" "安装脚本下载成功！"
	else
		logger -t "${self_name}" "安装脚本下载失败！"
		exit 1
	fi
	chmod +x $INSTALLER
	sh $INSTALLER >> $INSTALLER.log 2>&1
	logger -t "${self_name}" "开始安装并尝试更新opkg包列表..."
	opkg update
	if [ $? -eq 0 ] ; then
		logger -t "${self_name}" "安装成功！"
	else
		logger -t "${self_name}" "安装失败! See $INSTALLER.log for details."
		exit 1
	fi
	rm -f $INSTALLER $INSTALLER.log
	logger -t "${self_name}" "Congratulations!"
	logger -t "${self_name}" "If there are no errors above then Entware successfully initialized."
	logger -t "${self_name}" "Found a Bug? Please report at https://github.com/Entware/Entware/issues"
fi
