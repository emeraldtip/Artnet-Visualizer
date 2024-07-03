# Artnet Visualizer
An incomplete project to visualize artnet.

The purpose of this program is to display the artnet signals from QLC+. This was done to have the Digital Sputnik Voyager lights sync up with eachother as just sending artnet packages over wifi would make them desync and look bad. I used the Artnet Visualizer to visualize all the RGB values sent form qlc, then captured the output of the visualizer with obs with a spout filter on the window capture and then received the spout capture in the Digital Sputnik Voyager Controller app for windows, where I set the effect of the lights to be Spout.
The lights now sync up, with maybe a few more ms of delay.

The current setup is to run 8 Digital Sputnik Voyager 4ft lamps in 16-segment mode. Each segment has an RGB value and a color temperature mixer channel. I ignored the CTO channel and only added the RGB channels into each segment.

Processing is fairly easy to play around with, so if you need any other configuration, just mess around with the script a bit.
