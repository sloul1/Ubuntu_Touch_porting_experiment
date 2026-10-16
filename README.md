# ubuntu_touch_porting_experiment
An experiment to port Ubuntu Touch operating system for Motorola Edge 30 Neo.  


## Preface  

<img src="images/ubuntu_touch_logo_dark.png" alt="Ubuntu touch logo dark" style="width: 20rem;">  

At the start of this [Ubuntu Touch](https://www.ubuntu-touch.io/) porting project I have no earlier experience of developing operating systems for mobile phones. My earlier experience is purely flashing different operating systems including [crDroid](https://crdroid.net/), [LineageOS](https://lineageos.org/) (and CyanogenMod as it was named earlier), [Sailfish OS](https://sailfishos.org/) and of course [AOSP based operating systems (read Android)](https://source.android.com/docs/setup) on Android phones back and forth with some little tweaking of those. I'm not sure if getting SSH up and running and getting Mullvad VPN working on a Sailfish OS should be considered as real development.  

## Hardware  

[Motorola Edge 30 Neo](https://www.gsmarena.com/motorola_edge_30_neo-11635.php) was chosen as I have interest also for developing [Sailfish OS](https://forum.sailfishos.org/t/motorola-edge-30-neo-port-from-verdanditeam/29547). At the moment writing this there is an active development for it by [VerdandiTeam](https://verdanditeam.com/device/miami).

I sourced my hardware from a Lithuanian private seller on [Vinted](https://www.vinted.com/). When asked the seller kindly provided me a screenshot of the battery tab of DevCheck app to determine the battery wear. After paying the product (90€ + the platform service fee 5,20€) it took 7 days to get the phone on my hands in Finland. 


## Inspecting and testing the hardware

The first time I started the phone aquired it booted straight in to Android. No additional installation was necessary for this. There wasn't any user accounts and no password defined.  

### Checking the installed Android version   
<img src="images/android_version.png" alt="Android version" style="width: 20rem;">


### Testing the hardware using manufacturer's own hardware test  
<img src="images/hardware_test_full.png" alt="Hardware test full" style="width: 20rem;">  

It took few minutes to go through the `Full test`  
  
<img src="images/hardware_test_full_test_results.png" alt="Hardware test full" style="width: 20rem;">    
The test results


### Checking the condition of the battery using adb

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
Percentage for battery status can be calculated by dividing `charge_full` by `charge_full_design`.  
`(3694000 / 4020000) * = 91,89` which is approximately `92 %`.
