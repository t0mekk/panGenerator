# LPM Amsterdam 2016 Workshop (May 12th - 14th)

## Bits+Atoms – Tangible interfaces for exhibitions and events

![cover](http://pangenerator.com/varia/workshopImg1_01b.jpg)

Workshop by [panGenerator](http://www.pangenerator.com). More information can be found [here](http://liveperformersmeeting.net/event/2016-amsterdam/artists/pangenerator/performances/bitsatoms-tangible-interfaces-for-exhibitions-and-events-120/).



###Software

* [Processing 3.0](http://www.processing.org)
* [Arduino](http://www.arduino.cc)

###Hardware

* [Arduino](http://www.arduino.cc)
* [Sparkfun Essential Sensor Kit](https://www.sparkfun.com/products/12862)

###Setup

* Connect Arduino via USB
* Upload code from sensors/ folder (.ino file from corresponding subfolder)
* Create the circut based on [Fritzing](http://fritzing.org/home/) schematic located in circut subfolder of each sensor example
* Install OSCP5 library for Processing
* Launch receiver.pde
* Check if you get any input visible on the graphs
* Launch the Processing example from the subfolder of the example (.pde file)
* Have fun testing the sensor and modifing the code and building your own tangible interface :)

_Note that you might have to download additional libraries for some of the examples:_

* OSCP5 for Processing (OSC communication between receiver.pde and the examples)
* Accelerometer library for Arduino to work with [Sparkfun accelerometer](https://www.sparkfun.com/products/12756)
