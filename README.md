# Arduino Support for Telemetry-PCB

Board support files for https://github.com/spookysys/telemetry-pcb

Fork of https://github.com/arduino/ArduinoCore-samd


## Installation

Add this to Additional Boards Manager URLs in Arduino Studio's Preferences: `https://raw.githubusercontent.com/spookysys/telemetry-arduino/master/publish/package_l.raumschiffbau_index.json`

Then go to Board Manager and install Rocket Brain by L.Raumschiffbau.

## Gotchas

The included firmware is for Arduino Zero, and has not been adjusted for this board. Don't use the meny in Arduino Studio to program it to the Telemetry board. Instead, install the firmware for Adafruit's Feather M0 card, available in my telemetry-pcb repository and from Adafruit. You might also need the Adafruit M0 Windows drivers.

## License and credits

This core has been developed by Arduino LLC in collaboration with Atmel.

Modified by Eivind Liland


```
  Copyright (c) 2015 Arduino LLC.  All right reserved.

  This library is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation; either
  version 2.1 of the License, or (at your option) any later version.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
  See the GNU Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General Public
  License along with this library; if not, write to the Free Software
  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
```
