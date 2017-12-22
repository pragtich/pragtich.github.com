---
layout: post
title: "Installing LibreElec 8 on an Odroid C2"
category: "Computer stuff"
tags: []
indeximage: LE.png 
comment_id: LE8OdroidC2
summary: "I had to do quite a few small changes to make LE 8 work as I want on my Odroid C2"
---


# Installing LE

Burning an SD card with the Libreelec utility did not work, but Etcher did the trick. I also switched from a 2 GB to an 8 GB card, perhaps that was a factor, too. 

Installed the image onto an SD card, so that I can switch back to the original installation if it doesn't work out. I ended up using [LibreELEC-Odroid_C2.aarch64-8.2.1.img.gz](http://releases.libreelec.tv/LibreELEC-Odroid_C2.aarch64-8.2.1.img.gz)

# Recovering the library

This is where I was really happy to have the EMMC with the original Kodi image. It's really easy to swap it in and out, so that you can get access to the original data and files.

Exported the original library to a single file.

Imported it again in the new install. Seemless. You do need to switch the skin to `Advanced` mode in order to get access to the `Import` and `Export` functions.

Browsing the network in order to open the library was a challenge at first. It helps if you set the `Workgroup` to the same workgroup that your server is in. I had to change it in 2 places: The LibreElec Add-on and the Kodi network settings. Then, it worked.

# Disable SSH password

SSH on Libreelec only supports the default user/pass combination (`root/libreelec`). In order to secure this, I used `ssh-copy-key root@libreelec` to copy my ssh keys to the device. You might need to make a key first, Google it.

Then, disable the password login in the Libreelec settings addon in Kodi.

# Disable blinking blue led

[Followed this link](https://jbtronics.wordpress.com/2016/05/12/odroid-c2-change-the-function-of-the-blue-led/) 

The startup scripts in Libreelec are very simple, so actually you put the following into `/storage/.config/autostart.sh`:

``` shell
echo none > /sys/devices/gpio_leds.43/leds/blue:heartbeat/trigger
```

and then (using ssh):

``` shell
chmod a+x autostart.sh
```

Another option for the trigger, is `default-on`. I prefer this trigger in combination with a killing of the LED at shutdown, to confirm a safe shutdown state. This is in my `/Configfiles/shutdown.sh`:

``` shell
#!/bin/sh

case "$1" in
  halt)
    # your commands here

	echo none > /sys/class/leds/blue\:heartbeat/trigger
    ;;
  poweroff)
    # your commands here
	echo none > /sys/class/leds/blue\:heartbeat/trigger
    ;;
  reboot)
    # your commands here
    ;;
  *)
    # your commands here
    ;;
esac
```


# Favourite plugins

- Youtube
- BSPlayer
- Arctic Zephyr
- Uitzendinggemist (NPO)
- Nederland 24

# Keymap changes


The Minix A2 Lite air mouse is quite nice, but the default support in Kodi is a bit lacking. You can improve it a lot with a few modifications. The first, is to be able to use the `back` button properly.

As a reference, [the following site is really helpful, as it lists the key codes for the remote](http://kodi.wiki/view/MINIX_A2)

## Back button goes back in menus

[On the Odroid forum](http://www.minixforum.com/threads/fix-a2-a2-lite-back-button-in-xbmc.3294/)


I created a file called `A2lite.xml` into the Samba share `/Userdata/keymaps` on the box. Restart (the skin?) and the back button behaves properly. Look at the forum posts for a few options, including automatically stopping the media playing.

The file:

``` xml
<keymap>
<global>
<keyboard>
<backspace>Back</backspace>
<key id='61467'>Back</key>
</keyboard>
</global>
<FullscreenVideo>
<keyboard>
<backspace>Back</backspace>
</keyboard>
</FullscreenVideo>
</keymap>
```

## Subtitle shifting

I like to use the Fast Forward and Fast Reverse buttons to shift the sub delay. That way, it's easy to fix small errors in timing. Also, I configure the key with the three horizontal lines, to switch subtitle options.

A `Subs.xml` could look like this:

``` xml
<keymap>
 <global>
  <keyboard>
   <key id="61654">contextmenu</key>
  </keyboard>
 </global>
 <fullscreenvideo>
  <keyboard>
   <key id="61654">nextsubtitle</key>
   <key id="61627">subtitledelayminus</key>
   <key id="61626">subtitledelayplus</key>
  </keyboard>
 </fullscreenvideo>
</keymap>
```

# Getting LIRC to work 

**Careful: this is untested and probably not really correct**

cp /etc/lirc/lircd.conf.amremote /storage/.config/lircd.conf
reboot

systemctl stop eventlircd.service 
systemctl stop lircd@lirc0:default:lircd.conf.amremote.service
ps aux|grep lirc

	597 root       0:00 {kodi.sh} /bin/sh /usr/lib/kodi/kodi.sh --standalone -fs --lircdev /run/lirc/lircd
	602 root       2:15 /usr/lib/kodi/kodi.bin --standalone -fs --lircdev /run/lirc/lircd
	773 root       0:00 grep lirc
  
irrecord --device /dev/lirc0 /storage/.config/lircd.conf
