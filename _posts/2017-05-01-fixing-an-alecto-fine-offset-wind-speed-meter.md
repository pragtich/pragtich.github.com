---
layout: post
title: "Fixing an Alecto (Fine Offset) wind speed meter"
category: Mechanical
tags: [ Alecto Weather ]
indeximage: AlectoAnemo.png 
comment_id: AlectoAnemo
summary: "The Anemometer on my Alecto WS-3000 weather station died. It turned out to be an easy fix."
---

# Fixing the anemometer on an Alecto WS-3000 weather station

The Alecto WS-3000 has been a very popular weather station, due to its good price and good performance. It includes a large LCD base station with temperature, humidity and pressure monitoring, and an outside unit with temperature, humidity, rainfall and wind speed. It seems that it was manufactured by a Chinese company, known under the name Fine Offset. 

After a few years on the roof, the wind speed sensor stopped working. Sometimes it would turn freely, but mostly it would just bounce back and forth around one point. Figuring that it must be a very simple construction, I started exploring.

# Fun, but not what we're looking for

The three screws at the bottom looked like a good place to start. After removing them (very carefully), a look at the internals:

![What's that?]({% postfile bottom1.jpg %} "The internals")

Beneath a pile of spider carcasses, we find a small PCB with a reed relay. It's mounted in the plane of rotation, and it seems to be switching twice per revolution. Besides for the spider's remains, there seems to be some slight corrosion on the PCB. It is likely that some condensation in the anemometer caused this. Since it's still working, let's leave it as is.

# So it must be under the dome

The culprit must be under the dome, then. Tricky: the plastic is starting to degrade somewhat and might not be very strong any more. Two large screwdrivers and some patience were in order. Eventually it came off in one piece, revealing the rotor.

![The rotor]({% postfile rotor.jpg %} "The rotor")

The rotor is really simple, it is a single injection molded piece with a small magnet pressed into it. The magnet rotates around the reed relay, causing it to switch.

The rotor is pressed onto a bearing, which is heat staked onto the body of the anemometer. The bearing has clearly seized, it's movement is crunchy and sometimes blocks altogether. I forgot to take a picture of this, but I promise that the bearing was there!

Opening up the heat stake with a soldering iron was not the most fun I've ever had, but eventually:

![The body]({% postfile body.jpg %} "The body")


Luckily, our Chinese friends chose a super-common bearing type that gets a lot of use in the RC world, so ordering replacements was a matter of minutes' work. It's the MR105-2RS, a 5x10x4 mini bearing. Really easy to find. 

Putting things back together was simple enough, just a matter of pressing everything together carefully. It runs as it should again.
