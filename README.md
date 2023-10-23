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


<!-- GETTING STARTED -->
## Getting Started

If your Steam directory is the default "**C:\Program Files (x86)\Steam\**", then you can just grab the [Steam_Guide_Button_Disable - Default Steam install.ps1](https://github.com/CriticalPoint/Automatically-Disable-Steam-Big-Picture-Mode-Guide-Button/blob/main/1%20-%20POWERSHELL%20SCRIPTS%20IN%20HERE/Steam_Guide_Button_Disable%20-%20Default%20Steam%20install.ps1) script and, after reading on to see what it does, give it a run.

If you've got Steam installed to a non-standard location, you'll need to edit the file (to include your path) first - easy peasy - this is whilst I finish up another script that will allow you to paste your path, and yet another that will just go and find it for you (better still).


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

Unless you're down with PS, understanding it might be a challenge, so I've broken it down for you. Here's what it does...

_Declares the file path variable_
```
$filePath = "C:\Program Files (x86)\Steam\config\config.vdf"
```
_Makes a Backup of your current config.vdf_
```
Copy-Item -Path $filePath -Destination "$filePath.backup"
$i = 1
while (Test-Path "$filePath.backup.$i") {
    $i++
}
Rename-Item -Path "$filePath.backup" -NewName "$filePath.backup.$i"
```
_Read the file contents into a string_
```
$fileContents = Get-Content -Path $filePath
```
_Split the file contents into an array (Regex didn't cut it because, well, lack of text spacing!)_
```
$fileLines = $fileContents.Split([Environment]::NewLine)
```
_Create a new array to store the updated lines, and iterate through to remove the strings_
```
$updatedFileLines = @()

foreach ($fileLine in $fileLines) {
    $updatedFileLine = $fileLine.replace("guide:b0,", "").replace("guide:b1,", "").replace("guide:b2,", "").replace("guide:b3,", "").replace("guide:b4,", "").replace("guide:b5,", "").replace("guide:b6,", "").replace("guide:b7,", "").replace("guide:b8,", "").replace("guide:b9,", "").replace("guide:b10,", "")```
```
_Add the updated file line to the new array, and join the lines back into a string_
```
$updatedFileLines += $updatedFileLine

$updatedFileContents = $updatedFileLines -join [Environment]::NewLine
```
_Save the updated file contents to the output file (overwrites config.vdf)_
```
Set-Content -Path $filePath -Value $updatedFileContents
```

Granted, it's a bit of a faff and it's taken me all day but you couyld look at it that it's my first PS script, so I'm pretty freakin' proud of that fact; I'mm willing to learn if anyone can tell me a better way to do it...


<!-- Proof it works -->
## Changes to the file - Output

You'll find both copies of the config.vfd in the [diff check of config.vfd](https://github.com/CriticalPoint/Automatically-Disable-Steam-Big-Picture-Mode-Guide-Button/tree/main/diff%20check%20of%20config.vfd) folder

See the final Diff Check (minus all my personal info) [Remove all Guide button binds (guide:bxx) from 'congif.vdf'](https://www.diffchecker.com/TxvnAz0R/)


<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better then please, fork the repo and create a pull request. You can also open an issue with the "enhancement" tag, whatever works for you.

Don't forget to give the project a star! Thanks again!


<!-- LICENSE -->
## License

Distributed under the Apache License. See `LICENSE.txt` for more information.


<!-- CONTACT -->
## Contact

Mike Page - Reach me on here if you need me! 👍🏻

Project Link: [CriticalPoint/Automatically-Disable-Steam-Big-Picture-Mode-Guide-Button](https://github.com/CriticalPoint/Automatically-Disable-Steam-Big-Picture-Mode-Guide-Button)


#myFirstRepo

<p align="right">(<a href="#readme-top">back to top</a>)</p>