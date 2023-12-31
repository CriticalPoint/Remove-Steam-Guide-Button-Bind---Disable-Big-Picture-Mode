# SEE ISSUE #6 - https://github.com/CriticalPoint/Remove-Steam-Guide-Button-Bind---Disable-Big-Picture-Mode/issues/6

# Get/Set the three variables we need to create the scheduled task
$author = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name # Author info from host
$steamPath = (Get-Command 'Steam.exe' -ea stop -CommandType Application).Path # Path to 'Steam.exe'
$guideUnbindPath = Get-Location -Path "Guide Unbind - Default Steam Install Location.ps1" # Script location

$newTask = New-ScheduledTask -TaskName "SteamWatchdog" -Description "Runs Guide button unassign after Steam launch is registered" -Author $author # Create scheduled task definition

$newTrigger = New-EventTrigger -Subscription " 
    <QueryList>
        <Query Id="0" Path="Security">
            <Select Path="Security">
                *[System[Provider[@Name='Microsoft-Windows-Security-Auditing'] and Task = 13312 and (band(Keywords,9007199254740992)) and (EventID=4688)]]
            </Select>
        </Query>
        <Query Id="1" Path="EventData">
            <Select Path="EventData">
                *[Data[@Name='NewProcessName'] and (Data='$pathInjectedHere')]
            </Select>
        </Query>
    </QueryList>
" -Delay "PT8S" # Set trigger
$newTask | Register-ScheduledTask -Trigger $newTrigger # Register trigger

$newAction = New-ScheduledTaskAction -Execute "pwsh" -Argument "-ExecutionPolicy Unrestricted -WindowStyle Hidden -File \"$guideUnbindPath\"" # Set action
$newTask | Register-ScheduledTask -Action $newAction # Register action
