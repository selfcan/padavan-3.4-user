#download binary file to /opt/bin
#https://github.com/pymumu/smartdns/releases/tag/Release46.1
THISDIR = $(shell pwd)

all: 
download_test:
	
extract_test:
	
config_test:


clean:

romfs:
	$(ROMFSINST) -p +x $(THISDIR)/smartdns.sh /etc/storage/smartdns.sh
	$(ROMFSINST) /etc_ro/smartdns_address.conf
	$(ROMFSINST) /etc_ro/smartdns_blacklist-ip.conf
	$(ROMFSINST) /etc_ro/smartdns_custom.conf
	$(ROMFSINST) /etc_ro/smartdns_whitelist-ip.conf
