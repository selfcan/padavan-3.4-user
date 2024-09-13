all:

romfs:
	mkdir -p $(INSTALLDIR)/etc_ro/opt
	$(ROMFSINST) -p +x /usr/bin/opkg.sh
	$(ROMFSINST) -p +x /usr/bin/opt-start.sh
	$(ROMFSINST) -p +x /usr/bin/opt-mount.sh
	$(ROMFSINST) -p +x /usr/bin/opt-umount.sh
	$(ROMFSINST) -p +x /usr/bin/opt-opkg-upd.sh
	$(ROMFSINST) -p +x /usr/bin/opt-mkswap

clean:

