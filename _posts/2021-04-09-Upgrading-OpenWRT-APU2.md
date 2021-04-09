---
layout: post
title: "Upgrading OpenWRT on x86 (PC Engines APU2)"
category: "Computer stuff"
tags: [OpenWRT, APU2]
indeximage: OpenWRT.jpg
comment_id: UpgradeAPU2OpenWRT
summary: "It should be trivial to upgrade OpenWRT, but there are some things that you need to remember."
---
# Upgrading OpenWRT on an APU2

I am running OpenWRT on a PC Engines APU2 board. After too many broken promises regarding consumer grade routers, this one is really proving to be superior. The combination with [OpenWRT is ideal when used as a Wifi router, since OpenWRT gives much better performance on Wifi than the competitors](https://teklager.se/en/knowledge-base/compex-wle200nx-wle600vx-benchmark/).

One drawback with OpenWRT on `x86` is that the upgrade process is not trivial. Since OpenWRT is normally installed from device-specific packages, it assumes that all required programs (and especially kernel modules) are included in the install package. In the case of the `x86` platform, this is impossible. This makes upgrades a tad more involved.


## Get access

Luci can do a `sysupgrade` for you, but I always end up locked out in the end, so might as well go straigt to the serial console. This is best anyway, because you can follow what's going on. 
I am guessing that, if I were to invest in a hardware network adapter for my laptop, a wired network connection would also work. 

The APU2 has an industry standard RS-232, so a simple RS-232 to USB adapter helps. I bought one with the APU2. The console runs at 115200 baud by default. 

## Backup

Backup entire router [through Luci](https://10.0.0.1/cgi-bin/luci/admin/system/flash). It will not hurt and is very quick on this system.

Later on, we will need a list of the installed packages, so let's make that and transfer it to a safe place.

```shell
# opkg list-installed | awk '{print $1}' > mypackages.txt
# scp mypackages.txt user@machine:
```


## Download the package


This is inspired by [The OpenWRT wiki](https://openwrt.org/docs/guide-user/installation/sysupgrade.cli). Of course, choose the latest release folder (`targets/x86/64/*combined-ext4*`).

```shell
# wget https://downloads.openwrt.org/releases/19.07.7/targets/x86/64/openwrt-19.07.7-x86-64-combined-ext4.img.gz
# wget https://downloads.openwrt.org/releases/19.07.7/targets/x86/64/sha256sums
# sha256sum -c sha256sums | grep -v FAILED
```


If OK, continue.

## sysupgrade

```shell
# sysupgrade -v openwrt-19.07.7-x86-64-combined-ext4.img.gz
```

The system will reboot and will come back up without the important kernel modules (for example, for the Wifi cards). Thankfully, it does have the drivers required for the Ethernet ports, and the Ethernet configuration has also been recovered. So at lease, we can run `opkg` without problems. This is where a wired connection or a console login are essential.

## Upgrade packages

The Wiki says that it is necessary to upgrade the existing packages:

```shell
opkg update
opkg list-upgradable
opkg list-upgradable | cut -f 1 -d ' ' | xargs opkg upgrade 
```

For me, there were none when installing to 19.07.7. Perhaps we might see a few upgrades when the release gets older? Since OpenWRT warns against blind upgrading, I do not think this is a great idea in general.


## Restore packages

Since the `x86` package is by necessity very general, we need to install our preferred packages. That's where the prepared list comes in handy!

```shell
# #On the system where the list was saved before
# cat mypackages.txt | pbcopy
# cat  << EOF > mypackages.txt
<<paste>>
EOF
# opkg update
# cat mypackages.txt |xargs opkg install
```

This feeds the list to opkg as a long list in the argument vector. Thankfully the wired networks are back online, so this should be painless.

## Opkg Error

Most likely, `opkg` will complain about some config files being different from default.

```
Collected errors:
 * resolve_conffiles: Existing conffile /etc/config/ddns is different from the conffile in the new package. The new conffil.
 * resolve_conffiles: Existing conffile /etc/ssl/openssl.cnf is different from the conffile in the new package. The new con.
 * resolve_conffiles: Existing conffile /etc/config/sqm is different from the conffile in the new package. The new conffile.
 * resolve_conffiles: Existing conffile /etc/config/luci is different from the conffile in the new package. The new conffil.
 * resolve_conffiles: Existing conffile /etc/config/ucitrack is different from the conffile in the new package. The new con.
 * resolve_conffiles: Existing conffile /etc/config/openvpn is different from the conffile in the new package. The new conf.
```

This makes sense, because we edited them. I tend to ignore this unless something breaks. If you are really conscientious, you can inspect each one:

```shell
# opkg install diffutils
# diff file1 file1-opkg
```

## Reboot

Is it all working now?


## Resize partition

Reflashing the SSD causes the filesystem to reflect the package's setting, therefore wasting most of the SSD's ample space (16GB in my case). This is not difficult to do, but is most easily done when not booting from the SSD.

Following [a part of Teklager's instructions](https://teklager.se/en/knowledge-base/openwrt-installation-instructions/), I used a Debian Live USB stick. Boot from it (you don't need the boot menu, it boots from USB by default) and hit `TAB` in the Debian menu. Add the following to the kernel command line:

```
 console=ttyS0,115200
 ```

Hit `Enter` and it should boot. Login as user `user` with password `live` and `sudo su` into a root shell.

Get network access somehow. I typically use Wifi through my phone. It might also work to temporarily switch back to my provider's router.

```shell
# apt-get update
# apt-get install parted
# parted /dev/sda print
# parted /dev/sda resizepart 2 16G
# parted /dev/sda print
# e2fsck -f /dev/sda2
# resize2fs /dev/sda2 
```

This is all really quick on these SSDs, and painless once you have `parted` installed.

## Reboot back into OpenWRT

```shell
# reboot now
```

And everything should be back up and running!
