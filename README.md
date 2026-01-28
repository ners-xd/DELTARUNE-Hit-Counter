# DELTARUNE Hit Counter Mod
<b>NOTE</b>: The supported game versions are:
- Windows Chapters 1-4 v1.04 (CH1 1.40 / CH2 1.46 / CH3 v0.0.098 / CH4 v0.0.098)
- Windows Chapters 1-4 v1.05 Beta (CH1 1.41 / CH2 1.47 / CH3 v0.0.099 / CH4 v0.0.100)
- Switch Chapters 1-4 v1.04 (CH1 1.28 / CH2 1.34 / CH3 v0.0.095 / CH4 v0.0.096).

This mod counts the amount of hits that the player takes. The count is global, meaning it isn't affected by switching chapters or reloading a file.  

A hit counts as an avoidable loss of HP in battle or in the overworld, including the arcade minigame in Chapter 2 and the Legend of Tenna and Sword boards in Chapter 3.
  - The following do NOT count as hits:
    - Chapter 1: Hitting the white lights in Checkerboard
    - Chapter 2: Being ran over by the overworld cars in Cyber City (including the Toby Fox car in the Egg room), HP depletion due to ThornRing
    - Chapter 3: Getting hit or missing notes in the Cooking and Lightners Live minigames in Boards 1 and 2, Susie taking damage from a bomb after she throws one (it DOES count as a hit if any other character takes damage)
    - Chapter 4: Being pushed by water during the climb sections, taking damage from the unavoidable sword attacks in either Knight chase
  - In addition, for balancing reasons, you can only take up to one hit in these scenarios:
    - Taking damage in the Chapter 2 basement teacup ride
    - Taking damage to the first part of The Knight's sword corridor attack. The part where the swords get launched in random areas counts as a separate hit
    - Taking damage to Balthizard's clouds that only come up when at least one other enemy is in the battle.

# How to install and use

# Contributing
How to contribute to the mod:
- Create a fork of the repo and download the files
- Download [the latest](https://github.com/nhaar/ump/releases/latest) version of UMP and place the script in the same folder as the mod
- Use [the latest](https://github.com/underminersteam/undertalemodtool/releases/latest) version of UndertaleModTool
- Open a chapter's data.win, click on Scripts -> Run other script... -> bingosync_script.csx to import the mod and you can save the file
- You can find a guide on how to use UMP [here](https://github.com/nhaar/ump/blob/main/guide/guide.md)
- If you've made some modifications and you want them to be added in the mod, open a Pull Request and we'll look at it.

# Credits
- Coding: marti005, NERS 
- UMP: nhaar.
