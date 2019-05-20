# FencePost
The goal of this fork is to take the cool [project](https://github.com/space150/spaceLock) by [Space150](https://www.space150.com/opening-doors-with-space150s-apple-watch-app-2/) and exend the [Fence](https://repo.mieweb.com/projects/FEN/repos/fence) to support controlling access to a physical thing (eg: a door, a light, etc.)

The idea is that the action could be triggered from a phone, watch, etc, but only if that device is within the proximty of the sensor. 

## Hardware

The RFDuino does two main things: it acts as a beacon to allow our apps to know that a door is within range (we’ve covered beacons before), and it also allows us to send a signal to our doors when they should open. To use the RFDuino, you need a few other commodity parts that cost less than few dollars.

![Hardware](https://www.space150.com/wp-content/uploads/2015/10/RFduino.jpg)

To physically open the door we need an electronic door strike. On a normal door, the strike is the metal part of the door that secures the deadbolt or locking mechanism. An electric strike is a version of this that can be opened with an electrical signal, allowing a door to be opened normally (with a key), or electronically by releasing the strike. For this project, we chose a model from Leviton that cost about 0. If you are working with a door that already has an electronic strike, you won’t need a new one, but you’ll need to figure out how to integrate with the existing unit.

![App](https://www.space150.com/wp-content/uploads/2015/10/app-runthrough.gif)

# spaceLock

[Blog post with pics](https://www.space150.com/opening-doors-with-space150s-apple-watch-app-2/)

The goal of this project is to use the new Apple Watch to interact and open doors in the physical space. This project includes the iOS app and WatchKit extension, and a RFduino application and solenoid circuit. Using the combination of these, you can turn any door into a “smart” door, and a seamless physical to digital connection.

This project is a product of spaceLab, space150’s research and development division.

# Directory Structure

* <code>arduino</code> contains the physical lock arduino sketch and library dependencies. The lock itself is running on a RFDuino, other platforms will be supported in the future.

* <code>docs</code> contains an EAGL schematic for a reference implementation of the RFDuino integrated with a solenoid lock. Works with a 12VDC solenoid up to 1 amp.

* <code>ios</code> contains the iOS iPhone application with WatchKit extension.

# Security & Known Issues

This project is more of a "proof of concept" in its current state. A few key items need to be addressed to ensure a secure implementation:

* The AES encryption keys are stored in a plist file within the application bundle. This will in the future be changed so that the keys only reside on a secure server. Once downloaded the application will instead store them in the system Keychain.
* The arduino lock currently has no way of updating its internal clock to match wall-clock time. This prevents us from verifying the timestamp of the encrypted commands. An addition of a Wifi module and NTP client will be added in the future so that the unlock/lock commands are time-sensitive, this will prevent replay attacks.
* There are probably many more security issues, if you do find one or have a suggestion, feel free to send a pull request or email to shawn.roske@space150.com.
