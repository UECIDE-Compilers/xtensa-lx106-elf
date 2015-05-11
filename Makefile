ESPTOOL_LINUX64=https://github.com/igrr/esptool-ck/releases/download/0.4.3/esptool-0.4.3-linux64.zip
ESPTOOL_LINUX32=
ESPTOOL_OSX=https://github.com/igrr/esptool-ck/releases/download/0.4.3/esptool-0.4.3-osx.zip
ESPTOOL_WIN32=https://github.com/igrr/esptool-ck/releases/download/0.4.3/esptool-0.4.3-win32.zip

XTENSA_OSX=http://download.igrr.me/osx-xtensa-lx106-elf.tgz
XTENSA_LINUX32=
XTENSA_LINUX64=http://download.igrr.me/linux64-xtensa-lx106-elf.tgz
XTENSA_WIN32=http://download.igrr.me/win32-xtensa-lx106-elf.tgz

build-linux-amd64:
	mkdir -p tmp
	wget -c -O tmp/esptool-linux64.zip ${ESPTOOL_LINUX64}
	wget -c -O tmp/xtensa-linux64.tgz ${XTENSA_LINUX64}
	
	mkdir -p build

	tar -C build -zxvf tmp/xtensa-linux64.tgz
	unzip -d build tmp/esptool-linux64.zip
