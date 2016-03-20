#!/bin/bash
upkg-buildpackage -B -alinux-amd64
upkg-buildpackage -B -alinux-i386
upkg-buildpackage -B -awindows-amd64
upkg-buildpackage -B -awindows-i386
upkg-buildpackage -B -adarwin-amd64

