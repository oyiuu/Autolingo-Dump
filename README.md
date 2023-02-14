# Autolingo Dump
The most cursed, most unstable, most inefficient script(-adjustments/-addition) I have ever made, but it works.\
[Note: This script, made by smintf called 'Autolingo', has been adjusted to my preferences and needs. If you are not satisfied with the current structure, I have written a small guide how to adjust it for your needs.]

## Requirements

AutoHotkey V2 (https://www.autohotkey.com/v2/)

Windows 7+ (Autolingo has macOS and Linux support, though I only tested it on Windows 10.)

## How To

0. **Import** script to your browser and **enable** it

1. Go to a **LEGENDARY** course (e.g. https://www.duolingo.com/lesson/unit/4/level/10) and duplicate the tab twice, so you have a total of **three** tabs opened of the **same course**

2. Open an extra tab (e.g. https://www.duolingo.com/learn)

3. Start the .ahk script

3. Press ALT+'x'

(ALT+'4': Pause Script | ALT+'3': Resume Script)

![](https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExMDRhYmIzNjg1YzkwM2M4OGI2MjkxMjAxODZlYWZiYTAxMGY5ZjIwMiZjdD1n/aSsXgyrBoy63CWcqa1/giphy.gif)

## What happens

Legendary courses have two stages, 20XP after 8 questions and 40XP after 16 questions. Legendary courses can be solved 8 times in total but we don't want to solve them in order to keep completing them and receive more XP. This script will solve questions until it reaches 20XP, quit to receive the 20XP and redirect to the course stage again to reactivate the script. This happens in an infinite loop.

TL;DR - Complete three courses for 20XP each in a span of around 20 seconds (depending on your hardware).

Average: 1000XP/10min

## Adjusting the script for your needs

*content_scripts/DuolingoSkill.js*: 

```javascript
  setIntervalX(callback, delay, repetitions) {
    var x = 0;
    var intervalID = window.setInterval(function () {
      
      callback();

      if (++x === repetitions) {
        window.clearInterval(intervalID);
        setTimeout(() => {
          document.querySelector("[data-test='quit-button']")?.click();
        }, 2000); //CHANGE: Quit - wait 2000ms
        setTimeout(() => {
          document.querySelector('[class="_3HhhB _2NolF _275sd _1ZefG _3yQTJ _27Lhl"]')?.click();
        }, 3000); //CHANGE: Confirm the popup - wait 3000ms
        setTimeout(() => {
          window.open("https://www.duolingo.com/lesson/unit/4/level/10", "_top"); //CHANGE: Link of the course
        }, 7500); //CHANGE: Load website - 7500ms
      }

    }, delay);
  }
```
```javascript
  startf() {

    this.setIntervalX(() => {
      this.state_machine = setTimeout(this.complete_challenge, 100);
    }, 700, 12); //CHANGE: Solve challenge - wait 700ms, repeat 12 times in total
  }
```
Note: The interval for ``this.setIntervalX()`` is important. 12 means, it will solve 12 questions and quit. This number depends on your needs and your hardware.

Even though the script TECHNICALLY only needs to solve 8 questions, it depends how many tabs you have opened. For one tab only, 8 should be enough.

For the default structure (3 challenge tabs, 1 idle - 4 total), 12 should be good enough. The **more tabs** you have opened, the **higher the interval** has to be. This value has been determined by trial-and-error.

*.ahk*:

```ahk
$!x::
   Loop
   {
     SendInput, !y
     Sleep, 2000
     SendInput, ^{Tab}
     Sleep, 1000
     SendInput, !y
     Sleep, 2000
     SendInput, ^{Tab}
     Sleep, 1000
     SendInput, !y
     Sleep, 2000
     SendInput, ^{Tab}
     Sleep, 16000
     SendInput, ^{Tab}
    }
```

Note: This script has been created with a lot of trial-and-error again. Change the Sleeep Time how you want. Delete or add Inputs how you like.

## FAQ

Q: Why is this script inefficient, unstable and cursed?

A: I haven't thought about efficiency much. I was wondering if I was able to automate the whole process while being idle. If your browser is NOT focussed, the script will not work. If something pops up while the script is running, it will stop working. Sometimes it will skip a tab, because it has not been tested sufficiently.

## Known Bugs

- Skip a tab without restarting the script (too fast?)
- Cannot match pairs

## Credits

Autolingo by smintf (https://github.com/smintf/autolingo)
