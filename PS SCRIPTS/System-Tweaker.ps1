############################################### ADJUSTING CPU CORES TO MAX USE ####################################################
Write-Output "`n`n 1) TWEAKING CPU Cores"
Sleep -Seconds 3

Set-ItemProperty -Path 'HKLM:\SYSTEM\ControlSet001\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\51dea550-bb38-4bc4-991b-eacf37be5ec8\' -Name ValueMax -Value 0 | Out-Null
Set-ItemProperty -Path 'HKLM:\SYSTEM\ControlSet001\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\51dea550-bb38-4bc4-991b-eacf37be5ec8\' -Name ValueMin -Value 0 | Out-Null

#######################################  ##### ADJUSTING WINDOWS APPEARANCE ####################################################
Write-Output "`n`n 2) ADJUSTING APPEARANCE FOR BEST PERFORMANCE"
Sleep -Seconds 3

Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects' -Name VisualFXSetting -Value 2 | Out-Null

########################################### ADJUSTING DEFENDERS SCHEDULED SCAN ####################################################
Write-Output "`n`n 3) TWEAKING Windows Defender Scheduled Scan"
Sleep -Seconds 3

$p = New-ScheduledTaskPrincipal -UserId "$($env:USERDOMAIN)\$($env:USERNAME)" -RunLevel "Limited"
$s = New-ScheduledTaskSettingsSet -RunOnlyIfIdle
Set-ScheduledTask -TaskName 'Windows Defender Scheduled Scan' -TaskPath '\Microsoft\Windows\Windows Defender\' -Principal $p -Settings $s | Out-Null
Write-Output "`n  ALL DONE !!!`n"
