# Ubuntu Touch porting experiment
An experiment to port Ubuntu Touch operating system for Motorola Edge 30 Neo.  


## Preface  

<img src="images/ubuntu_touch_logo_dark.png" alt="Ubuntu touch logo dark" style="width: 20rem;">  

Purpose of this experiment is to have one more device for minimizing data collection by tech giants, preventing surveillance and tracking, and enhancing security against cyber threats. [https://keepandroidopen.org/](https://keepandroidopen.org/) 

At the start of this [Ubuntu Touch](https://www.ubuntu-touch.io/) porting project I have no earlier experience of developing operating systems for mobile phones. My earlier experience is purely flashing different operating systems including [crDroid](https://crdroid.net/), [LineageOS](https://lineageos.org/) (and CyanogenMod as it was named earlier), [Sailfish OS](https://sailfishos.org/) and of course [AOSP based operating systems (read Android)](https://source.android.com/docs/setup) on Android phones back and forth with some little tweaking of those. I think that getting SSH up and running and getting one Mullvad VPN profile working on a Sailfish OS doesn't count as so real OS development.  

## Hardware  

[Motorola Edge 30 Neo (miami)](https://www.gsmarena.com/motorola_edge_30_neo-11635.php) was chosen as I have interest also for developing [Sailfish OS](https://forum.sailfishos.org/t/motorola-edge-30-neo-port-from-verdanditeam/29547). At the moment writing this there is an active development for it by [VerdandiTeam](https://verdanditeam.com/device/miami).  

<img src="images/miami_lineageos_wiki.png" alt="Android version" style="width: 20rem;">  
Motorola Edge 30 Neo image from:  

[LineageOS Wiki](https://wiki.lineageos.org/devices/miami/)  
  
I sourced my hardware from a Lithuanian private seller on [Vinted](https://www.vinted.com/). When asked the seller kindly provided me a screenshot of the battery tab of DevCheck app to determine the battery wear.  

<img src="images/battery_status_seller.jpg" alt="Battery status from seller" style="width: 20rem;">  

The picture suggests battery designed capacity is around 87% from original design capacity 4020 mAh. At the moment I haven't figured out if it is possible to extract battery charge cycles from this phone model.

After paying the product (90€ + the platform service fee 5,20€) it took 7 days to get the phone on my hands in Finland. 


## Inspecting and testing the hardware

Externally the phone matched the description of selling ad. First there was a problem with usb-c cable not attaching firmly enough to the phone for charging. This was resolved scraping lint and other dirt from the charging port with self made non-conductive plastic tool. Be careful not to bend the usb-c port when cleaning it. Use tool flexible enough.

The first time I started the aquired phone it booted straight in to Android. No additional installation was necessary for this. There wasn't any user accounts and no password defined.  

### Checking the installed Android version   
<img src="images/android_version.png" alt="Android version" style="width: 20rem;">


### Testing the hardware using manufacturer's own hardware test  
<img src="images/hardware_test_full.png" alt="Hardware test full" style="width: 20rem;">  

It took few minutes to go through the `Full test`  
  
<img src="images/hardware_test_full_test_results.png" alt="Hardware test full" style="width: 20rem;">    
The test results


### Checking the battery condition using adb

The battery status percentage can be calculated by dividing `charge_full` by `charge_full_design` * 10.  

```bash
adb shell cat /sys/class/power_supply/battery/charge_full
```
```bash
3694000
```
```bash
adb shell cat /sys/class/power_supply/battery/charge_full_design
```
```bash
4020000
```

`(3694000 / 4020000) * 10 = 91,89` is approximately `92 %` of the original capacity of this battery.  

If the phone hasn't been used in a while the full battery charge capacity can grow a bit when draining battery empty and charging it back to 100% few times. This is called battery refreshing.

The battery full charge capacity has fluctuated a bit between charges. I've recorded differing results (3694 mAh ~ 91,9% -> 3514 mAh ~ 87,4%). We'll see if this settles after after some more cycles.
