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
  <h3 align="center">Steam Big Picture Mode + XBox Controller with Xbox Extended Feature Support enabled</h3>
  <a href="[https://github.com/CriticalPoint/Automatically-Disable-Steam-Big-Picture-Mode-Guide-Button](https://github.com/CriticalPoint/Automatically-Disable-Steam-Big-Picture-Mode-Guide-Button?readme=1#readme-top)">
    <img src="images/Xbox_Steam_Logo-small.png" alt="The Xbox and Steam Logos together with the wording 'Steam' and 'Big Picture Mode'" width="397" height="224">
  </a>
  <br>
  <br>
  <p align="center">
    Annoyed by Steam and their enforcing Big Picture Mode when I press my Xbox Guide button - **as you may be, since you're here**, I decided to come up with a script that will 'just work' when run on your Windows PC.
    <br>
    <br>
    I've pulled it apart, analysed, changed and compiled it into something that, hopefully, everyone can make use of - but how could I be sure you'd trust that it is what it says it is, and that it would actually get used?
    <br>
    <br>
    Cue; my first GitHub repo - where you can explore code before running it, and transparently see what it does - Yeeha!
  </p>
</div>

<!-- What it does -->
## What does this actually do?

Great question - You know when you're just minding your business, chilling and playing some games - your favourite tune comes on and you hit the Xbox Guide button to maybe access GameBar and BLAM - Steam Big Picture Jump Scare for NO REASON AT ALL! 😱 Well, this little script makes that shtiuff stop, immediately.

Any and all bindings to the guide button, no matter if you're on a Playstation, Xbox, Nintendo, hell, even a MegaDrive controller is stored within the config.vdf in your Steam config folder - this rips that binding, and ONLY that binding, out, for good, the easy way.

Sort of like, say, oh I don't know, how you'd think that turning off a giant button that says "Guide Button Focuses Steam" might work. Yeah, well, it doesn't. This does. Ex facto; end of.

All joking aside - there are some truly wonderful gamers out there that have shared fixes on various forums, the closest 'fix' I saw was to ['*Setup Device Inputs*' and skip the Guide button assignment altogether](https://www.reddit.com/r/Steam/comments/11jfpmo/how_do_i_disable_xbox_button_launching_big/); pretty neat, but I've found that it borks the paddles on the Elite controllers. Plus I was a bit bored, and so that's how we ended up here.

Love it or hate it Valve won't ever address the fact that people don't want Big Picture Mode and, when they ultimately change it again, targeting the SDL config directly will still work as it's how controllers are configured to work on Windows, not Steam!

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

# 1 - Declare the file path variable
# 2 - Make a Backup of current config.vdf
# 3 - Read the file contents into a string (see below as to why, Regex fail)
# 4 - Split the file contents into an array of lines
# 5 - Create a new array to store the updated file lines
# 6 - Create a variable to store the number of strings deleted
# 7 - Iterate over the file lines and remove the strings
# 8 - Increment the number of strings deleted if different from original
# 9 - Add the updated file line to the new array
# 10 - Join the updated file lines back into a string
# 11 - Save the updated file contents to the output file
# 12 - Output the number of strings deleted to the console

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

🐛 Got a bug to report? Please, do so [here](https://github.com/CriticalPoint/Automatically-Disable-Steam-Big-Picture-Mode-Guide-Button/issues/new?assignees=CriticalPoint&labels=&projects=&template=bug_report.md&title=)!


<!-- CONTACT -->
## Contact

Mike Page - Reach me on here if you need me! 👍🏻

Project Link: [CriticalPoint/Automatically-Disable-Steam-Big-Picture-Mode-Guide-Button](https://github.com/CriticalPoint/Automatically-Disable-Steam-Big-Picture-Mode-Guide-Button)


<!-- LICENSE -->
## License

Distributed under the Apache License. See `LICENSE.txt` for more information.

#myFirstRepo

<p align="right">(<a href="#readme-top">back to top</a>)</p>
