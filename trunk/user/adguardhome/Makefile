#download AdGuardHome Binary File to path /opt/bin/
#url:https://github.com/AdguardTeam/AdGuardHome/releases/tag/v0.107.59
THISDIR = $(shell pwd)
all:

clean:

romfs:
#	$(ROMFSINST) -p +x $(THISDIR)/adguardhome.sh /usr/bin/adguardhome.sh
	chmod +x $(THISDIR)/adguardhome.sh
	mv $(THISDIR)/adguardhome.sh /opt/images/
	echo "*.sh文件放到/etc/storage \n二进制放到/opt/bin" >/opt/images/readme.txt
