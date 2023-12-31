<#

# ORIGINAL FILE - DO NOT USE - INCOMPLETE - SERVES ONLY AS A BACKUP

# Get/Set variables for scheduled task
$author = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name # Author info from host

# Create the scheduled task definition
$newTask = New-ScheduledTask -TaskName "SteamWatchdog" -Description "Runs Guide button unassign after Steam launch is registered" -Author $author

# Set the trigger for the scheduled task
$newTrigger = New-EventTrigger -Subscription "
    <QueryList>
        <Query Id="0" Path="Security">
            <Select Path="Security">
                *[System[Provider[@Name='Microsoft-Windows-Security-Auditing'] and Task = 13312 and (band(Keywords,9007199254740992)) and (EventID=4688)]]
            </Select>
        </Query>
        <Query Id="1" Path="EventData">
            <Select Path="EventData">
                *[Data[@Name='NewProcessName'] and (Data='C:\Program Files (x86)\Steam\steam.exe')]
            </Select>
        </Query>
    </QueryList>
" -Delay "PT8S"
$newTask | Register-ScheduledTask -Trigger $newTrigger

# Set the actions for the scheduled task
$newAction = New-ScheduledTaskAction -Execute "pwsh" -Argument "-ExecutionPolicy Unrestricted -WindowStyle Hidden -File \"C:\PS\Guide Unbind - Default Steam Install Location.ps1\""
$newTask | Register-ScheduledTask -Action $newAction

#>