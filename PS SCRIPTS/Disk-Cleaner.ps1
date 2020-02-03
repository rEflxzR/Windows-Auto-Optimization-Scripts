########################################################## DISK CLEANUP #############################################################
Write-Output "`n`n 1) PREPARING TO CLEAN YOUR SYSTEM"
Start-Sleep -Seconds 3

cleanmgr /verylowdisk
Wait-Process "cleanmgr"

################################################## SYSTEM FILE INTEGRITY CHECK ######################################################
Write-Output "`n`n` 2) Starting SYSTEM INTEGRITY CHECK"
Start-Sleep -Seconds 2
sfc /scannow | Out-Null

if(${?} -eq $False)
{
    Write-Output "`n  Found some errors with Windows Image..........Attempting Repair Operation`n`n"
    while($true)
    {
        $res = Read-Host -Prompt "Please Make Sure, You are Connected to Internet [yeah i am(y)]: "
        if(($res -eq 'Y') -or ($res -ne 'y'))
        {
            Write-Output "`n`n 3) Trying to Repair Windows Image............"
            DISM /ONLINE /CLEANUP-IMAGE /RESTOREHEALTH | Out-Null
            Write-Output "`n  ALL DONE !!!`n"
            exit
        }
        else {
            Write-Output "`n  OK :-(`n"
            exit
        }
    }
}
