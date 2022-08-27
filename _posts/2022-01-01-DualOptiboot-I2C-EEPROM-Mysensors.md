---
layout: post
title: "Adding Over the Air (OTA) Firmware updates to a battery-powered MySensors Node"
category: "Computer stuff"
tags: [Arduino, MySensors, OTA]
indeximage: Battery-sensor.jpg
comment_id: MysProMiniOTA
summary: "The MySensors node can automatically update itself over the air, a process called OTA. Normally this is done with SPI flash chips, but I chose to use some I2C EEPROMs that I had lying around. Thankfully, some work by others has made this doable."
---


# Hardware setup

I had some `24LC256` chips lying around, which I probably purchased in an attempt to meet the Free Shipping limit, or something silly like that. Since I had some experience working with I2C, this seemed like a sensible way to add OTA to my project. Honestly, SPI is the way to go because of the better support.

The I2C bus always needs pull-up resistors. When one is really pushing the bus, [the values of these resistors need some optimization][i2c-R]. In this case, however, we can probably live with pretty much any pull-up (including the Atmel's built-in ones). I chose values between 2 and 6 kΩ. Both `SCL` and `SDA` lines are pulled up to the `Vcc` (2x AA battery power or 3.3V from the USB-serial adapter).

The address pins for the EEPROM are all tied to `GND` in order to choose the chip's default I2C address. This can be changed later on, but why bother?
The `Enable` pin is constantly tied to `GND`.

Annoyingly, the `SCL` and `SDA` pins on the `Promini 8MHz 3.3V` that I am using, are not in the standard 2x 12 pin headers, but separately on the PCB. We need the pins marked `A4` (`SDA`) and `A5` (`SCL`). What I did, was solder two Dupont wires to the EEPROM, and use these to jumper to the top of the Arduino. It should also be possible to do something on the bottom of the PCB, but the pins are annoyingly not aligned to the rest. If you are making your own PCBs, that's okay. But my protoboard approach does not allow this easily.

# Software setup

Following [the OTA instructions by MySensors][mys-ota] shows that we need either `MYSBootloader`, or `DualOptiboot`. Since `MYSBootloader` currently only supports the NRF radios, not the RFM69, I went the `DualOptiboot` route.

[Kisse66 has published his results on using OTA with I2C chips](https://forum.mysensors.org/topic/5259/ota-fw-update-using-i2c-eeprom), and also shared [his code for the modified bootloader on Github](https://github.com/kisse66/DualOptiboot). Thanks to Kisse66!!

I made some local changes, [so I forked the repo into my own](https://github.com/pragtich/dualoptiboot). This allowed me to play around and still have the nice tracking that `git` provides. I also added some ready-made bootloaders in the `hex/` subfolder, for future use.

I documented the flashing process in the README there, including some free-flowing notes on the successful and unsuccessful attempts at flashing the stuff correctly.  I was not able to get the `Makefile` to work properly. And I needed/wanted control over the Fuses. So I ended up doing the flashing and compiling manually.

## Compiling the bootloader

Make sure that the compile and toolchains are in your `$PATH`. For me, with the platformio toolchains already installed on my Mac, this means:

```shell
$ export PATH=$PATH:~/.platformio/packages/toolchain-atmelavr/bin:~/.platformio/packages/tool-avrdude
```

Compiling the bootloader is as simple as:

```shell
$ make atmega328_e8
```

Compiling is fast, it's only a small program.

## Flashing the bootloader and fuses

You need some kind of programmer in order to program the fuses and bootloader. You can use an `USBasp` programmer, but I chose [to use an Arduino-as-ISP, which I have documented before][isp]. Simple and effective.

I use the following command line to flash both the fuses and the bootloader in one go, using the Arduino ISP:

```shell
$ export PATH=$PATH:~/.platformio/packages/toolchain-atmelavr/bin:~/.platformio/packages/tool-avrdude
$ avrdude  -C ~/.platformio/packages/tool-avrdude/avrdude.conf  -p atmega328p -c arduino -P /dev/cu.wchusbserial1410 -b 19200 -U flash:w:optidebugflash57k6.hex  -U hfuse:w:0xDA:m -U lfuse:w:0xFF:m -U efuse:w:0xFE:m

```

The fuse settings might not yet be perfect, I'm aiming for a `1.8V BOD`, the `8MHz` external crystal oscillator and a `1 kword (2k byte)` boot partition. More testing should confirm if I got this right. `:-)`

I noticed that the bootloader does not run reliably when there is no program loaded in memory to run. It simply loops in a watchdog loop and never activates the serial bootloader code. So, I merged a blink script into the `hex` file. This way, the bootloader has something to run, and the problems are finished.
This merging of two hex files is easy, just `cat` them together (or merge them in an editor) and delete the `EOF` marker in between (the line that goes something like this: `:00000001FF`).

A working file that I use, [is included in my repository][blinkhex]. 

## Test

Now, when disconnected from the ISP, the node should blink. Also, it should be flashable over serial by the Arduino IDE or Platformio using the arduino protocol. I chose a baud rate of `57600 baud`, so you should set this speed for things to work properly.

Next step is to upload a MySensors node program.

## Mysensors I2C OTA node

The code for the I2C EEPROM has been added to MySensors (thanks again to Kisse66!), so if your MySensors is at all up-to-date, it should already be included.

You need to add the following to your node's `#define`s:

```C
#define USE_I2C_EEPROM
#define MY_OTA_FIRMWARE_FEATURE
#define MY_OTA_USE_I2C_EEPROM 
```

That's it!

Now you should be able to start `MYSController` [(get it here)][myscontroller] and test the OTA for real. Since I'm on OS X, I run it under `Wine`, which works fine:

```shell
$ wine MYSController.exe
```

You need to add the firmware to the `Firmware/` folder under the MYSController folder, and might need to add the firmware to the `.csv` file in this folder.
Connect to your gateway, enable `Auto FW`, set `Battery Node` for your node and `Assign Firmware`. The next time the node reports, firmware update should start.

## Increase retries during OTA

I had an issue with OTA uploads usually failing. I traced this to random radio blackouts. Not sure weither this is caused by some disturbance in my area, or the gateway or MYSController flaking out. Nevertheless, the default MySensors OTA code only retries 5 times with `500ms` pause between attempts. That means that any disturbance longer than `~2.5 s` might cause the upload to fail.

[I updated my MySensors code to allow manually setting of the number retries and the pause between retries. ](https://github.com/pragtich/MySensors/commit/f1f00953850aeb0101ec7fabc189ac3ac68306ea). With this change, the following code snippet at the top of a node's code will increase the number of retries, and lengthen the pause before retry. This way, most of my OTA uploads succeed.

```C
// Only relevant when OTA enabled on the node
// Requires patched mysensors
#define MY_OTA_RETRY (50)
#define MY_OTA_RETRY_DELAY (1000u) // default 500u
```





It worked simply by running (I have platformio installed, and it has the avrdude stuff already):

```shell
$ export PATH=$PATH:~/.platformio/packages/toolchain-atmelavr/bin:~/.platformio/packages/tool-avrdude
$ avrdude -C ~/.platformio/packages/tool-avrdude/avrdude.conf  -p atmega328p -c arduino -P /dev/cu.wchusbserial1410 -b 19200 -U flash:w:optidebugflash57k6.hex  -U hfuse:w:0xD8:m -U lfuse:w:0xFF:m -U efuse:w:0xFE:m
```

Then connect the Arduino directly to a serial port and it should simply work.

## Working with platformio

Set `in platformio.ini`:


```
upload_speed = 57600
```

and run:

```shell
$ pio run -t upload -t monitor
```



I did have a problem with enabling the I2C EEPROM library:

```
I2CEeprom.h:49:23: fatal error: extEEPROM.h: No such file or directory
```

Earlier I cheated by manually adding the library dependency in platformio.ini. Why is platformio not finding the driver?

```
lib_deps = extEEPROM
```

Sometimes I get boot loops, for example when my sketches have lots of debugging enabled. Am a seeing memory overrun issues?
TODO: Check memory overrun protections in Platformio and update to match larger bootloader.



[i2c-R]: http://www.ti.com/lit/an/slva689/slva689.pdf
[mys-ota]: https://www.mysensors.org/about/fota
[isp]: https://www.pragti.ch/computer%20stuff/2018/09/10/Uploading_bootloader_Pro_Mini/
[blinkhex]: https://raw.githubusercontent.com/pragtich/DualOptiboot/master/hex/optidebugflash57k6.hex
[myscontroller]: https://www.mysensors.org/controller/myscontroller
