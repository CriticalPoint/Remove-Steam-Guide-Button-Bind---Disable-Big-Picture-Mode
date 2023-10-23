# 1 - Declare the file path variable
$filePath = "C:\Program Files (x86)\Steam\config\config.vdf"

# 2 - Make a Backup of current config.vdf
Copy-Item -Path $filePath -Destination "$filePath.backup"
$i = 1
while (Test-Path "$filePath.backup.$i") {
    $i++
}
Rename-Item -Path "$filePath.backup" -NewName "$filePath.backup.$i"

# 3 - Read the file contents into a string
$fileContents = Get-Content -Path $filePath

# 4 - Split the file contents into an array of lines
$fileLines = $fileContents.Split([Environment]::NewLine)

# 5 - Create a new array to store the updated file lines
$updatedFileLines = @()

# 6 - Iterate over the file lines and remove the strings
foreach ($fileLine in $fileLines) {
    $updatedFileLine = $fileLine.replace("guide:b0,", "").replace("guide:b1,", "").replace("guide:b2,", "").replace("guide:b3,", "").replace("guide:b4,", "").replace("guide:b5,", "").replace("guide:b6,", "").replace("guide:b7,", "").replace("guide:b8,", "").replace("guide:b9,", "").replace("guide:b10,", "")

    # 7 - Add the updated file line to the new array
    $updatedFileLines += $updatedFileLine
}

# 8 - Join the updated file lines back into a string
$updatedFileContents = $updatedFileLines -join [Environment]::NewLine

# 9 - Save the updated file contents to the output file
Set-Content -Path $filePath -Value $updatedFileContents
