#!/bin/sh

self_name="opt-start.sh"
logger -t "${self_name}" "开始运行  Entware检测是否安装?启动/opt/etc/init.d服务?"
optw_enable=`nvram get optw_enable`
[ "$optw_enable" != "1" ] && exit 0

# check /opt is mounted
# 如果/opt已经挂载了 则继续执行下一步
# 如果/opt没有挂载，则退出
mountpoint -q /opt || exit 0

# extend path to /opt
export PATH=/opt/sbin:/opt/bin:/usr/sbin:/usr/bin:/sbin:/bin

# 如果存在/opt/bin/opkg二进制文件， 则启动USB手动安装 需要自启动的服务/opt/etc/init.d下S***开头的服务
# 如果不存在/opt/bin/opkg二进制文件，则启动安装sh
if [ -f /opt/bin/opkg ] ; then
	logger -t "${self_name}" "call /opt/etc/init.d" "启动USB已安装的服务(S***开头的服务)"
	# start all services S* in /opt/etc/init.d
	for i in `ls /opt/etc/init.d/S??* 2>/dev/null` ; do
		[ ! -x "${i}" ] && continue
		${i} start
	done	
	exit 0
else
	/usr/bin/opt-opkg-upd.sh
fi
