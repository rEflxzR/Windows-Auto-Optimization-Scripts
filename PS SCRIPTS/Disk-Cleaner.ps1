########################################################## DISK CLEANUP #############################################################
Write-Output "`n`n 1) PREPARING TO CLEAN YOUR SYSTEM"
Start-Sleep -Seconds 3

cleanmgr /verylowdisk
Wait-Process "cleanmgr"

########################################################## DISK DEFRAG #############################################################
cls
Write-Output "`n`n 2) WARNING !!!!  We Are going to DEFRAG Your Disk"
Write-Output "`tYou Should SKIP this STEP if you are using an SSD(Solid State Drive)`n"
$res = Read-Host -Prompt "`nContinue ? [N for No]"
if (($res -ne 'N') -or ($res -ne 'n'))
{
    Write-Output "`n`n Initailizing DEFRAGGLER"
    Start-Sleep -Seconds 3
    Defrag /C /U /H
    Wait-Process "Defrag"
}
else {

}

################################################## SYSTEM FILE INTEGRITY CHECK ######################################################
cls
Write-Output "`n`n` 3) Starting SYSTEM INTEGRITY CHECK"
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
