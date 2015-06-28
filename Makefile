ESPTOOL_linux-amd64=https://github.com/igrr/esptool-ck/releases/download/0.4.5/esptool-0.4.5-linux64.tar.gz
ESPTOOL_linux-i386=http://cdn.majenko.co.uk/esp/esptool-0.4.5-linux32.tar.gz
ESPTOOL_linux-armhf=http://cdn.majenko.co.uk/esp/esptool-0.4.5-linux-armhf.tar.gz
ESPTOOL_darwin-amd64=https://github.com/igrr/esptool-ck/releases/download/0.4.5/esptool-0.4.5-osx.tar.gz
ESPTOOL_windows-amd64=https://github.com/igrr/esptool-ck/releases/download/0.4.5/esptool-0.4.5-win32.zip
ESPTOOL_windows-i386=https://github.com/igrr/esptool-ck/releases/download/0.4.5/esptool-0.4.5-win32.zip

#XTENSA_darwin-amd64=http://download.igrr.me/osx-xtensa-lx106-elf.tgz
#XTENSA_linux-amd64=http://download.igrr.me/linux64-xtensa-lx106-elf.tgz
#XTENSA_windows-amd64=http://download.igrr.me/win32-xtensa-lx106-elf.tgz
#XTENSA_windows-i386=http://download.igrr.me/win32-xtensa-lx106-elf.tgz
#XTENSA_linux-i386=http://cdn.majenko.co.uk/esp/xtensa-lx106-elf-linux32.tgz
#XTENSA_linux-armhf=http://cdn.majenko.co.uk/esp/xtensa-lx106-elf-linux-armhf.tgz

#http://download.igrr.me/osx-xtensa-lx106-elf-gb404fb9.tgz

XTENSA_darwin-amd64=http://download.igrr.me/osx-xtensa-lx106-elf-gb404fb9.tgz
XTENSA_linux-amd64=http://download.igrr.me/linux64-xtensa-lx106-elf-gb404fb9.tgz
XTENSA_windows-amd64=http://download.igrr.me/win32-xtensa-lx106-elf-gb404fb9.tgz
XTENSA_windows-i386=http://download.igrr.me/win32-xtensa-lx106-elf-gb404fb9.tgz

XTENSA_linux-i386=http://cdn.majenko.co.uk/esp/xtensa-lx106-elf-linux32.tgz
XTENSA_linux-armhf=http://cdn.majenko.co.uk/esp/xtensa-lx106-elf-linux-armhf.tgz

.PHONY: build

build: build-${DEB_HOST_ARCH}

build-linux-amd64:
	mkdir -p tmp
	wget -q -c -O tmp/esptool-linux-amd64.tar.gz https://github.com/igrr/esptool-ck/releases/download/0.4.5/esptool-0.4.5-linux64.tar.gz
	wget -q -c -O tmp/xtensa-linux-amd64.tar.gz http://download.igrr.me/linux64-xtensa-lx106-elf-gb404fb9.tgz
	rm -rf build staging
	mkdir -p build
	mkdir -p staging
	tar -C build -zxf tmp/xtensa-linux-amd64.tgz
	mkdir -p build/xtensa-lx106-elf/tools
	tar -C staging -zxf tmp/esptool-linux-amd64.tar.gz
	cp staging/esptool*/esptool build/xtensa-lx106-elf/tools

build-linux-i386:
	mkdir -p tmp
	wget -q -c -O tmp/esptool-linux-i386.tar.gz https://github.com/igrr/esptool-ck/releases/download/0.4.5/esptool-0.4.5-linux32.tar.gz
	wget -q -c -O tmp/xtensa-linux-i386.tar.gz http://download.igrr.me/linux32-xtensa-lx106-elf-gb404fb9.tgz
	rm -rf build staging
	mkdir -p build
	mkdir -p staging
	tar -C build -zxf tmp/xtensa-linux-i386.tgz
	mkdir -p build/xtensa-lx106-elf/tools
	tar -C staging -zxf tmp/esptool-linux-i386.tar.gz
	cp staging/esptool*/esptool build/xtensa-lx106-elf/tools

build-linux-armhf:
	mkdir -p tmp
	wget -q -c -O tmp/esptool-linux-armhf.tar.gz https://github.com/igrr/esptool-ck/releases/download/0.4.5/esptool-0.4.5-linux-armhf.tar.gz
	wget -q -c -O tmp/xtensa-linux-armhf.tar.gz http://download.igrr.me/linux-armhf-xtensa-lx106-elf-gb404fb9.tgz
	rm -rf build staging
	mkdir -p build
	mkdir -p staging
	tar -C build -zxf tmp/xtensa-linux-armhf.tgz
	mkdir -p build/xtensa-lx106-elf/tools
	tar -C staging -zxf tmp/esptool-linux-armhf.tar.gz
	cp staging/esptool*/esptool build/xtensa-lx106-elf/tools

build-darwin-amd64:
	mkdir -p tmp
	wget -q -c -O tmp/esptool-darwin-amd64.tar.gz https://github.com/igrr/esptool-ck/releases/download/0.4.5/esptool-0.4.5-osx.tar.gz
	wget -q -c -O tmp/xtensa-darwin-amd64.tar.gz http://download.igrr.me/osx-xtensa-lx106-elf-gb404fb9.tgz
	rm -rf build staging
	mkdir -p build
	mkdir -p staging
	tar -C build -zxf tmp/xtensa-darwin-amd64.tgz
	mkdir -p build/xtensa-lx106-elf/tools
	tar -C staging -zxf tmp/esptool-darwin-amd64.tar.gz
	cp staging/esptool*/esptool build/xtensa-lx106-elf/tools

build-windows-amd64:
	mkdir -p tmp
	wget -q -c -O tmp/esptool-windows-amd64.zip https://github.com/igrr/esptool-ck/releases/download/0.4.5/esptool-0.4.5-win32.zip
	wget -q -c -O tmp/xtensa-windows-amd64.tar.gz http://download.igrr.me/win32-xtensa-lx106-elf-gb404fb9.tgz
	rm -rf build staging
	mkdir -p build
	mkdir -p staging
	tar -C build -zxf tmp/xtensa-windows-amd64.tgz
	mkdir -p build/xtensa-lx106-elf/tools
	unzip -d staging -j tmp/esptool-windows-amd64.zip
	cp staging/esptool.exe build/xtensa-lx106-elf/tools

build-windows-i386:
	mkdir -p tmp
	wget -q -c -O tmp/esptool-windows-amd64.zip https://github.com/igrr/esptool-ck/releases/download/0.4.5/esptool-0.4.5-win32.zip
	wget -q -c -O tmp/xtensa-windows-amd64.tar.gz http://download.igrr.me/win32-xtensa-lx106-elf-gb404fb9.tgz
	rm -rf build staging
	mkdir -p build
	mkdir -p staging
	tar -C build -zxf tmp/xtensa-windows-amd64.tgz
	mkdir -p build/xtensa-lx106-elf/tools
	unzip -d staging -j tmp/esptool-windows-amd64.zip
	cp staging/esptool.exe build/xtensa-lx106-elf/tools

install:
	mkdir -p ${DESTDIR}/compilers
	cp -RL build/xtensa-lx106-elf ${DESTDIR}/compilers/
	cp files/compiler.txt ${DESTDIR}/compilers/xtensa-lx106-elf


packages:
	dpkg-buildpackage -B -alinux-amd64
	dpkg-buildpackage -B -alinux-i386
	dpkg-buildpackage -B -alinux-armhf
	dpkg-buildpackage -B -awindows-amd64
	dpkg-buildpackage -B -awindows-i386
	dpkg-buildpackage -B -adarwin-amd64
