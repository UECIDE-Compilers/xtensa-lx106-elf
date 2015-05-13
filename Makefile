ESPTOOL_linux-amd64=https://github.com/igrr/esptool-ck/releases/download/0.4.3/esptool-0.4.3-linux64.zip
ESPTOOL_darwin-amd64=https://github.com/igrr/esptool-ck/releases/download/0.4.3/esptool-0.4.3-osx.zip
ESPTOOL_windows-amd64=https://github.com/igrr/esptool-ck/releases/download/0.4.3/esptool-0.4.3-win32.zip
ESPTOOL_windows-i386=https://github.com/igrr/esptool-ck/releases/download/0.4.3/esptool-0.4.3-win32.zip

XTENSA_darwin-amd64=http://download.igrr.me/osx-xtensa-lx106-elf.tgz
XTENSA_linux-amd64=http://download.igrr.me/linux64-xtensa-lx106-elf.tgz
XTENSA_windows-amd64=http://download.igrr.me/win32-xtensa-lx106-elf.tgz
XTENSA_windows-i386=http://download.igrr.me/win32-xtensa-lx106-elf.tgz

.PHONY: build

build: 
	mkdir -p tmp
	wget -q -c -O tmp/esptool-${DEB_HOST_ARCH}.zip ${ESPTOOL_${DEB_HOST_ARCH}}
	wget -q -c -O tmp/xtensa-${DEB_HOST_ARCH}.tgz ${XTENSA_${DEB_HOST_ARCH}}
	rm -rf build
	mkdir -p build
	tar -C build -zxf tmp/xtensa-${DEB_HOST_ARCH}.tgz
	mkdir -p build/xtensa-lx106-elf/tools
	unzip -d build/xtensa-lx106-elf/tools -j tmp/esptool-${DEB_HOST_ARCH}.zip

install:
	mkdir -p ${DESTDIR}/compilers
	cp -RL build/xtensa-lx106-elf ${DESTDIR}/compilers/
	cp files/compiler.txt ${DESTDIR}/compilers/xtensa-lx106-elf


packages:
	dpkg-buildpackage -B -alinux-amd64
	dpkg-buildpackage -B -awindows-amd64
	dpkg-buildpackage -B -awindows-i386
	dpkg-buildpackage -B -adarwin-amd64
