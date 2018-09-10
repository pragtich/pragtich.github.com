---
layout: post
title: "A battery powered Mysensors node from an Arduino Pro Mini clone"
category: "Computer stuff"
tags: [Arduino, MySensors]
indeximage: Battery-sensor.jpg
comment_id: MysProMiniBatt
summary: "It is not very difficult to build a reasonably nice MySensors node based on very affordable hardware. This is a reminder for myself in order to be able to reproduce one."
---

# A basic battery powered Mysensors node

Based on: [the documentation by MySensors](https://www.mysensors.org/build/battery) and a 3.3V 8MHz Arduino (clone) Pro Mini from the usual sources ([Banggood](https://www.banggood.com/), [AliExpress](http://aliexpress.com/)).

[Handy pinout guide](https://blog.adafruit.com/wp-content/uploads/2016/07/promini_final.png)

Perform the hardware mods from above link:

- Disable power LED (either remove it or the resistor next to it).
- Remove voltage regulator (in this case I linked the in & out pins to be able to power through the `RAW` pin.

# Make an Arduino ISP programmer

In order to reflash the bootloader, we need an In-System Programmer (ISP). It is possible to use another Arduino as the ISP, and I like to use another Pro Mini.

## Hardware
I follow the following schematic: 
![Fritzing schematic of Pro Mini ISP]({% postfile ProMiniISP_bb.jpg %})

And in reality on a breadboard, it looks like this (with a LED added to pin 9):

![Breadboard Pro Mini ISP]({% postfile ProMiniISP.jpg %})


## Flash the ISP firmware

- Start the Arduino IDE
- Open `ArduinoISP` sketch from [the repository](https://github.com/pragtich/Sensors/tree/master/ArduinoISP)
- Connect the ISP using a USB-serial connection
- Select board `Arduino Pro or Pro Mini`
- Flash the sketch. 

# Install boot loader:

In order to get a lower Brown Out voltage, we need to flash a new bootloader. Actually that's not strictly required, but it's the easiest way. I am using [Optiboot bootloaders compiled by Gert Sanders][bootloaders], so many thanks to him.

- Unpack rar in `Various-bootloader-files-based-on-Optiboot-62`
- Move folder `atmega328p` to `Arduino.app/Contents/Java/hardware` (this is the OS X location)
- Start `Arduino.app`
- Select Tools->Board->`atmega328p based - 32 pin TQFP`
- Select `8MHz - crystal - 38K4 - D13`
- Select `Brown out detection - 1V8`
- Select correct USB port
- Select `Programmer: "Arduino as ISP"`
- `Tools->Burn Bootloader`

# Test
- Connect the board to the USB serial adapter (disconnect the ISP)
- Upload example Blink
- Upload Blink with modified timings
- I also like to try the `ASCIITable` example
- Quit the Arduino IDE

# Upload the real script
I use platformio to run my projects, so uploading is pretty easy:

- Switch to the project folder
- Edit baud rates in the `platformio.ini`. I use `38400` for upload and `9600` for monitor.
- `pio run -t upload` or if you want a debug monitor: `pio run -t upload -t monitor`

[bootloaders]: https://www.openhardware.io/view/33/Various-bootloader-files-based-on-Optiboot-62
