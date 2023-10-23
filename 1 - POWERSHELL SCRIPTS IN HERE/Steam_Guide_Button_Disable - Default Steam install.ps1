# Declare the file path variable
$filePath = "C:\Program Files (x86)\Steam\config\config.vdf"

Copy-Item -Path $filePath -Destination "$filePath.backup"
$i = 1
while (Test-Path "$filePath.backup.$i") {
    $i++
}
Rename-Item -Path "$filePath.backup" -NewName "$filePath.backup.$i"

# Read the file contents into a string
$fileContents = Get-Content -Path $filePath

# Split the file contents into an array of lines
$fileLines = $fileContents.Split([Environment]::NewLine)

# Create a new array to store the updated file lines
$updatedFileLines = @()

# Iterate over the file lines and remove the strings
foreach ($fileLine in $fileLines) {
    $updatedFileLine = $fileLine.replace("guide:b0,", "").replace("guide:b1,", "").replace("guide:b2,", "").replace("guide:b3,", "").replace("guide:b4,", "").replace("guide:b5,", "").replace("guide:b6,", "").replace("guide:b7,", "").replace("guide:b8,", "").replace("guide:b9,", "").replace("guide:b10,", "")

    # Add the updated file line to the new array
    $updatedFileLines += $updatedFileLine
}

# Join the updated file lines back into a string
$updatedFileContents = $updatedFileLines -join [Environment]::NewLine

# Save the updated file contents to the output file
Set-Content -Path $filePath -Value $updatedFileContents
