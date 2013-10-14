---
layout: post
title: "Installing compiled images onto Beaglebone Black SD card"
category: Kippycam
tags: 
- beaglebone
- linux
comment_id: bbb-install-comiledimage
summary: "So you've managed to compile an Angstrom Linux image. How to get it onto the Beaglebone?"
---

# What's the point? 

So I managed to compile an image for the Beaglebone Black. The documentation is not bad, but it took some time to wait for some bugs to get updated in the `git`. This was thanks to VirtualBox and Ubuntu, as compiling on OS X was too painful. Compiling pretty much followed the basis instructions [at the main website](http://www.angstrom-distribution.org/building-angstrom). And I could see the image files available (hint: look in the subfolder `work` and find the `deploy` subfolder. 

But how to get this stuff onto the Beaglebone Black, and running?

# Creating a bootable SD card for Beaglebone Black 

Actually, someone before me [has been considerate and shared his experience (locally) compiling and installing Angstrom for Beaglebone Black](http://cwraig.id.au/?p=507). This is pretty much a copy of what he does.

Because of trouble getting a USB cardreader to show up un VirtualBox, and the incompatibility of the `mkcard.txt` script with OS X, I decided to use the BBB itself to write the SD card. This is based on the standard firmware from the circuitco website. So that is the set of executables that I had available. I booted the BBB with a nonbooting card (so that it will boot from the eMMC). The SD card then is located at `/mnt/sda`. The beaglebone is also on the network via the LAN port.

Then:

    #!bash
	root@beaglebone:~# wget http://www.angstrom-distribution.org/demo/beaglebone/mkcard.txt
	mkcard.txt mkcard.sh  
	chmod +x mkcard.sh 
	./mkcard.sh /dev/sda

	cd /mnt
	mkdir Angstrom
	mkdir boot
	mount -t vfat /dev/disk/by-label/boot boot
	mount /dev/disk/by-label/Angstrom Angstrom/

	df -h
	
This results in the following confirmation that we have stuff mounted right:

	#!bash
	Filesystem      Size  Used Avail Use% Mounted on
	rootfs          1.7G  1.1G  515M  69% /
	/dev/root       1.7G  1.1G  515M  69% /
	devtmpfs        250M     0  250M   0% /dev
	tmpfs           250M  4.0K  250M   1% /dev/shm
	tmpfs           250M  252K  250M   1% /run
	tmpfs           250M     0  250M   0% /sys/fs/cgroup
	tmpfs           250M  4.0K  250M   1% /tmp
	/dev/mmcblk0p1   70M   55M   16M  79% /media/BEAGLEBONE
	/dev/sda1        70M   512   70M   1% /mnt/boot
	/dev/sda2       1.8G   35M  1.7G   3% /mnt/Angstrom

Ready for installing the images!


# Installing the images 

Simply followed the stuff [from here](http://cwraig.id.au/?p=507):


	#!bash
	cd
	mkdir installs
	cd installs
	scp -r pragtich@10.0.0.102user@host:~/compiled-image-deploy-folder .
	cd compiled-image-deploy-folder
	cp u-boot-beaglebone-2013.04-r0.img /mnt/boot/uImage
	cp MLO-beaglebone-2013.04 /mnt/boot/MLO
	tar -xmv -C /mnt/Angstrom/ -f Angstrom-systemd-image-eglibc-ipk-v2012.12-beaglebone.rootfs.tar.gz 
	umount /mnt/boot 
	umount /mnt/Angstrom 
	
Then reboot and...

# Test!

	#!bash
	root@beaglebone:~# uname -a
	Linux beaglebone 3.8.13 #1 SMP Sun Oct 13 15:59:25 CEST 2013 armv7l GNU/Linux
	root@beaglebone:~# ps aux
	ps: invalid option -- 'a'
	BusyBox v1.20.2 (2013-09-14 09:40:16 CEST) multi-call binary.
	
	Usage: ps 
	
So the smaller `ps` delivered by `BusyBox` is now active, not the richer GNU version in the default install. Running `ps` also shows much less processes:

    #!bash
	root@beaglebone:~# ps
   PID USER       VSZ STAT COMMAND
	 1 root      4680 S    {systemd} /sbin/init
	 2 root         0 SW   [kthreadd]
	 3 root         0 SW   [ksoftirqd/0]
	 4 root         0 SW   [kworker/0:0]
	 5 root         0 SW<  [kworker/0:0H]
	 6 root         0 SW   [kworker/u:0]
	 7 root         0 SW<  [kworker/u:0H]
	 8 root         0 SW   [migration/0]
	 9 root         0 SW   [rcu_bh]
	10 root         0 SW   [rcu_sched]
	11 root         0 SW   [watchdog/0]
	12 root         0 SW<  [khelper]
	13 root         0 SW   [kdevtmpfs]
	14 root         0 SW<  [netns]
	15 root         0 SW   [kworker/0:1]
	16 root         0 SW   [bdi-default]
	17 root         0 SW<  [kintegrityd]
	18 root         0 SW<  [kblockd]
	19 root         0 SW   [khubd]
	20 root         0 SW   [irq/86-44e0b000]
	21 root         0 SW   [kworker/u:1]
	24 root         0 SW   [irq/23-tps65217]
	27 root         0 SW   [irq/46-4819c000]
	36 root         0 SW<  [rpciod]
	38 root         0 SW   [khungtaskd]
	39 root         0 SW   [kswapd0]
	40 root         0 SW   [fsnotify_mark]
	41 root         0 SW<  [nfsiod]
	42 root         0 SW<  [crypto]
	45 root         0 SW<  [pencrypt]
	46 root         0 SW<  [pdecrypt]
	53 root         0 SW<  [OMAP UART0]
	57 root         0 SW<  [kpsmoused]
	58 root         0 SW   [irq/150-mmc0]
	70 root         0 SW   [kworker/u:2]
	71 root         0 DW   [mmcqd/0]
	74 root         0 SW   [mmcqd/1]
	75 root         0 SW   [mmcqd/1boot0]
	76 root         0 SW   [mmcqd/1boot1]
	77 root         0 SW<  [deferwq]
	80 root         0 SW<  [kworker/0:1H]
	81 root         0 SW   [jbd2/mmcblk0p2-]
	82 root         0 SW<  [ext4-dio-unwrit]
	89 root     36536 S    /lib/systemd/systemd-journald
	91 root      3428 S    /lib/systemd/systemd-udevd
	94 root         0 SW   [kworker/0:2]
   117 root         0 SW   [ext4lazyinit]
   204 root         0 SW   [flush-179:0]
   304 root      2976 S    /lib/systemd/systemd-logind
   305 root      2152 S    /sbin/klogd -n
   306 root      2216 S    /sbin/syslogd -n -C64
   308 root      5392 S    /usr/sbin/connmand -n
   309 avahi     3168 S    avahi-daemon: running [beaglebone.local]
   311 root      1844 S    /sbin/agetty -s ttyO0 115200
   312 root      1844 S    /sbin/agetty --noclear tty1 38400 linux
   317 avahi     3052 S    avahi-daemon: chroot helper
   323 root      4644 S    /usr/sbin/wpa_supplicant -u
   327 root      2956 S    /usr/sbin/dropbear -i -r /etc/dropbear/dropbear_rsa_host_key -p 22
   328 root      2332 S    -sh
   331 root      2332 R    ps
 root@beaglebone:~# 


Done!
