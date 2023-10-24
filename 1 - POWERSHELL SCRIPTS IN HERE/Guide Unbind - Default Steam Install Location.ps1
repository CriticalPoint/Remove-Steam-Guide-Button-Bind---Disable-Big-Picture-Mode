# Remove-Steam-Guide-Button-Bind---Disable-Big-Picture-Mode

# 1 - Check PowerShell version (>7.0 required)
$powershellVersion = $PSVersionTable.PSVersion
if ($powershellVersion.Major -lt 7.0) {
  Write-Host "PowerShell version >7.0 required."
  exit
}
# 2 - Declares the file path
$filePath = "C:\Program Files (x86)\Steam\config\config.vdf"

# 3 - Makes a Backup of config.vdf > config.vdf.BACKUP.1 > config.vdf.BACKUP.2, etc
Copy-Item -Path $filePath -Destination "$filePath.backup"
$i = 1
while (Test-Path "$filePath.backup.$i") {
  $i++
}
Rename-Item -Path "$filePath.backup" -NewName "$filePath.backup.$i"

# 4 - Read the file contents to string
$fileContents = Get-Content -Path $filePath

# 5 - Splits the contents into an array
$fileLines = $fileContents.Split([Environment]::NewLine)

# 6 - Creates a new array to store the updated lines
$updatedFileLines = @()

# 7 - Creates a variable to store the number of strings deleted
$numberOfStringsDeleted = 0

# 8 - Iterates through the lines to remove the binds
foreach ($fileLine in $fileLines) {
  $updatedFileLine = $fileLine.replace("guide:b0,", "").replace("guide:b1,", "").replace("guide:b2,", "").replace("guide:b3,", "").replace("guide:b4,", "").replace("guide:b5,", "").replace("guide:b6,", "").replace("guide:b7,", "").replace("guide:b8,", "").replace("guide:b9,", "").replace("guide:b10,", "").replace("guide:b11,", "").replace("guide:b12,", "").replace("guide:b13,", "").replace("guide:b14,", "").replace("guide:b15,", "").replace("guide:b16,", "").replace("guide:b17,", "").replace("guide:b18,", "").replace("guide:b19,", "").replace("guide:b20,", "")

  # 9 - Increments the 'number of strings deleted' variable, if different to original
  if ($fileLine -ne $updatedFileLine) {
    $numberOfStringsDeleted++
  }

  # 10 - Adds the updated lines to the new array
  $updatedFileLines += $updatedFileLine
}

# 11 - Joins them back into a string
$updatedFileContents = $updatedFileLines -join [Environment]::NewLine

# 12 - Saves the updated file content to the output file (config.vdf)
Set-Content -Path $filePath -Value $updatedFileContents

# 13 - Outputs number of binds that have been deleted, to the console (verification).
Write-Host "Number of strings deleted: $numberOfStringsDeleted"
