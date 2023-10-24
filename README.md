<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a name="readme-top"></a>
<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->

<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
-->
<!-- PROJECT LOGO -->

<div align="center">
  <h3 align="center">Stop Steam JUMP SCARE when pressing Guide on your controller and being forced to Big Picture Mode (BPM)</h3>
  <a href="[https://github.com/CriticalPoint/Automatically-Disable-Steam-Big-Picture-Mode-Guide-Button](https://github.com/CriticalPoint/Automatically-Disable-Steam-Big-Picture-Mode-Guide-Button?readme=1#readme-top)">
    <img src="images/Xbox_Steam_Logo-small.png" alt="The Xbox and Steam Logos together with the wording 'Steam' and 'Big Picture Mode' written accross them" width="397" height="224">
  </a>
  <br>
  <br>
  <!--
  <h1 align="center" style="color:red;">Script temporarally offline - please be patient while I investigate a potential issue - just want to be sure</h1>
  <br>
  <br>
  -->
    <p align="center">
    Annoyed by Steam forcing Big Picture Mode when I press my Xbox Guide button (as you may be since you're here), I've made a script to disable it that will 'just work' on your Windows PC.
    <br>
    <br>
    I've pulled the Steam config apart, analysed it, changed it, tested it and finally arrived at something that everyone can make use of - a Powershell script that removes guide button binding at boot.
    <br>
    <br>
    Unsure anyone would trust spurious code on Valve forums and Reddit, I've put together #myFirstRepo - explore the code, decide if it's for you, ask questions, fork it, chop it, poke it, chew it up and/or spit it out - it's yours to do with what you will.
  </p>
</div>

<!-- What it does -->
## What does this actually do?

Great question - You know when you're just playing games, minding your business, listening to music and the like - you press your Guide button to access Gamebar and BAM - Big Picture Mode out of nowhere and for seemingly NO REASON 😱

You've tried to disable it, you've toggled different things off, then on, back to off, you're getting nowhere and you're now wondering if you can somehow get them to stop sort of half-way between on and off. You've done this some twenty-odd times now and it's still not working...

..."*Why isn't it working, what am I doing wrong?*". Nothing, young Padawan, you'te doing absolutley nothing wrong, at all. You''ve been set-up to fail, you're playing an unwinnable game against, an invisible competitor. It's not you, so you don't need to be forgiven for thinking that switching off a comedy-sized, giant button in the settings menu that says "Guide Button Focuses Steam", might actually work because, well, no, it doesn't. Well, this does.

"*How?*" another good one - It removes all Steam bindings to your guide button. It doesn't matter which controller you're using; Playstation, Xbox, Nintendo, aftermarket, off-brand or otherwise - the Guide button on your controller will no longer be bound (in Steam), and so it cannot jump-scare you, after running this file.

**Everything else is unaffected, Gamebar will still work as normal - it's just the Guide button that is unmapped from within Steam**

There are some truly wonderful gamers out there that have shared various fixes on forums - the closest I found was to run ['*Setup Device Inputs*' and skip the Guide button assignment altogether](https://www.reddit.com/r/Steam/comments/11jfpmo/how_do_i_disable_xbox_button_launching_big/), which is a pretty neat workaround, but I thought we could all benefit from a script. Plus I was a bit bored, and that's how we ended up here.

Love it or hate it, Valve won't ever address the fact that people don't want Big Picture Mode on their Guide button. By targeting the SDL config directly ('*guide*' is a non-Steam assignment, so the reference won't be changed [why, oh why did I just say that 😶]), means that this method should still work after various client updates and the like. It targets how controllers are configured to work on Windows, non-specific to Steam.

🐛 Got a bug to report? Please do so [here](https://github.com/CriticalPoint/Automatically-Disable-Steam-Big-Picture-Mode-Guide-Button/issues/new?assignees=CriticalPoint&labels=&projects=&template=bug_report.md&title=), otherwise I can't improve upon it!

<p align="left">The software is provided as-is, and it's up to you if you choose to use it. I invite you to <a href="#disclaimer">read the discalimer</a>.</p>

Enjoy! 🤜🏻🤛🏻


<!-- GETTING STARTED -->
## Getting Started

If your Steam directory is the default "**C:\Program Files (x86)\Steam\**", then you can just grab the [Steam_Guide_Button_Disable - Default Steam install.ps1](https://github.com/CriticalPoint/Automatically-Disable-Steam-Big-Picture-Mode-Guide-Button/blob/main/1%20-%20POWERSHELL%20SCRIPTS%20IN%20HERE/Steam_Guide_Button_Disable%20-%20Default%20Steam%20install.ps1) script and, after reading on to see what it does, give it a run.

If you've got Steam installed to a non-standard location, you'll need to edit the file (to include your path) first - easy peasy - this is whilst I finish up another script that will allow you to paste your path, and yet another that will just go and find it for you (better still) - watch this space.


<!-- PREREQUISITES -->
## Prerequisites

You'll need Powershell (>v7) to use this script.

You may already have v7 or above. To check, open up Powershell and (right click to) **paste** this, to find your version:
```
$PSVersionTable

```
If not, see [Installing PowerShell on Windows](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows)


<!-- USAGE -->
## Usage

Using it's easy, just double-click to run. Although you may have to adjust your execution policy

TL:DR - _Set-ExecutionPolicy Unrestricted_

Supplied on the understanding that you've read about [execution policy](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-7.3)

**Use with caution**


<!-- How it Works -->
## How It Works

Unless you're down with PS, understanding the script might be a challenge, so I've added comment throughout the file, and broken it down here for you. Here's what it does...

1 - Declare the file path variable

2 - Make a Backup of current config.vdf

3 - Read the file contents into a string (see below as to why, Regex fail)

4 - Split the file contents into an array of lines

5 - Create a new array to store the updated file lines

6 - Create a variable to store the number of strings deleted

7 - Iterate over the file lines and remove the strings

8 - Increment the number of strings deleted if different from original

9 - Add the updated file line to the new array

10 - Join the updated file lines back into a string

11 - Save the updated file contents to the output file

12 - Output the number of strings deleted to the console

Granted it's a bit of a faff. I wanted to do it with non-greedy RegEx but it didn't cut it because of the lack of spacing around the "guide:b4," string.
It's taken me all day to get here and so I look at it that as my first public PS script, I'm pretty darn proud of it!

I'd be happy to learn a different way, how would you have done it?


<!-- What Changes -->
## Changes to the output file

You'll find both copies of the config.vfd in the [diff check of config.vfd](https://github.com/CriticalPoint/Automatically-Disable-Steam-Big-Picture-Mode-Guide-Button/tree/main/diff%20check%20of%20config.vfd) folder. before *before-config.vdf*, and *after-config.vdf*.

The final Diff Check (minus all my personal info) is also available, here [Remove all Guide button binds (guide:bxx) from 'congif.vdf'](https://www.diffchecker.com/TxvnAz0R/)


<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better then please, fork the repo and create a pull request. You can also open an issue with the "enhancement" tag, whatever works for you.

Don't forget to give the project a star! Thanks again!


<!-- Bugs -->
## Issues and Bugs!

🐛 Got a bug? Please report it [here](https://github.com/CriticalPoint/Automatically-Disable-Steam-Big-Picture-Mode-Guide-Button/issues/new?assignees=CriticalPoint&labels=&projects=&template=bug_report.md&title=) so that I may improve upon the script(s)!


<!-- Disclaimer-->
## DISCLAIMER
<a name="disclaimer"></a>
This software is provided as-is and, although I have tested it on my machine, a couple of test VM's, in Windows Sandbox, and on my unsuspecting mates' PC, I'm afraid that I cannot accept any liability for 'damages', howsoever caused. Please understand that by using this software you do so at your own risk, and that constitutes your acceptance of the fact that I am not responsible for anything that has happened in the past by not using it, anything that may happen as a result of using it now, or by either using it, or not, in future. I have only invited you to understand what it is that I am offering - it's up to you if you choose to use it 🙏🏻


<!-- CONTACT -->
## Contact

Reach me via Discussions, if you need me! 👍🏻

Project Link: [CriticalPoint/Automatically-Disable-Steam-Big-Picture-Mode-Guide-Button](https://github.com/CriticalPoint/Automatically-Disable-Steam-Big-Picture-Mode-Guide-Button)


<!-- LICENSE -->
## License

Distributed under the Apache License. See `LICENSE.txt` for more information.


<p align="right">(<a href="#readme-top">back to top</a>)</p>
