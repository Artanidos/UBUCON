
all:
	@(cd sipgen; $(MAKE))

install:
	@(cd sipgen; $(MAKE) install)
	@test -d $(DESTDIR)/usr/lib/python3/dist-packages || mkdir -p $(DESTDIR)/usr/lib/python3/dist-packages
	cp -f sipconfig.py $(DESTDIR)/usr/lib/python3/dist-packages/sipconfig.py
	cp -f /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/build/sip-generator/sip-4.19.15/sipdistutils.py $(DESTDIR)/usr/lib/python3/dist-packages/sipdistutils.py
	/media/art/data/SourceCode/UBUCON/src/sysroot-android-32/host/bin/python /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/build/sip-generator/sip-4.19.15/mk_distinfo.py "$(DESTDIR)" /usr/lib/python3/dist-packages/sip-4.19.15.dist-info installed.txt

clean:
	@(cd sipgen; $(MAKE) clean)
