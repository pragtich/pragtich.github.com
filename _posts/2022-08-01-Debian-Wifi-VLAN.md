---
layout: post
title: "Accessing a Wifi VLAN in Debian Live"
category: "Computer stuff"
tags: [linux, networking, Wifi, Debian]
indeximage: Debian.jpg
comment_id: Debian-VLAN-Wifi
summary: "Quite a challenge: how to get Debian Live to join a Wifi network on a VLAN?"
---

# The Challenge

My network connection ('Delta Glasvezel') enters the house on a fiber and gets converted to Ethernet using a media converter. The internet signal is provided on VLAN 100, while the TV and Telephony signals are presumably on other VLANs. Normally my gateway will connect to the correct VLAN, but during the installation or upgrade of the router's operating system, this does not work.

A smart thing to do would probably be to start a local copy of the OS and package builds. That's a good way to make OpenWRT installs stable, anyway. And it would help to make the installs more reproducible.
For now, however, I'm too lazy.

Since the router does have Wifi cards, it's quite doable to get it online over Wifi. This can be done through a mobile hotspot, but the idealist in me doesn't enjoy this. How do I avoid using my mobile phone to provide Wifi network access?

In other words: how do I get Debian Live to access WiFi and connect to VLAN 100?

# Joining Wifi on Debian Live

It's documented [in their wiki](https://wiki.debian.org/WiFi/HowToUse), but I found it confusing and there were some small errors.

I ran it all as `root`, the prompt in the Wiki shows when super user rights are really needed.

```shell
# ip a
# iw dev
```

Shows the wireless device name. Turns out to be `wlp1s0`.

```shell
# ip link set wlp1s0 up
```

Enables the device for the scanning later?

```shell
# iwlist scan
```

A good chance to test the wifi adapter by scanning, and confirms the SSID.

Edited `/etc/network/interfaces` to add:

```
# my wifi device
allow-hotplug wlp1s0
iface wlp1s0 inet dhcp
        wpa-ssid ESSID
        wpa-psk PASSWORD
```		

What the wiki does not say: you need to restart networking for it to pick up the net interface:

```shell
# systemctl restart networking
```

Then you can bring it up:

```shell
# ifup wlp1s0
```

And test the connection:

```shell
# iw wlp1s0 link
# ip a
```

# Remaining challenge - VLAN

I have yet to figure out the details of accessing the VLAN -- this is left as a future exercise.
