################################################## REMOVING BUILT-IN PACKAGES ######################################################
$packages = @(
    'Microsoft.3DBuilder'
    'Microsoft.BingWeather'
    'Microsoft.DesktopAppInstaller'
    'Microsoft.GetHelp'
    'Microsoft.Getstarted'
    'Microsoft.HEIFImageExtension'
    'Microsoft.Messaging'
    'Microsoft.Microsoft3DViewer'
    'Microsoft.MicrosoftOfficeHub'
    'Microsoft.MicrosoftSolitaireCollection'
    'Microsoft.MicrosoftStickyNotes'
    'Microsoft.MixedReality.Portal'
    'Microsoft.MSPaint'
    'Microsoft.Office.OneNote'
    'Microsoft.OneConnect'
    'Microsoft.People'
    'Microsoft.Print3D'
    'Microsoft.ScreenSketch'
    'Microsoft.SkypeApp'
    'Microsoft.StorePurchaseApp'
    'Microsoft.VP9VideoExtensions'
    'Microsoft.Wallet'
    'Microsoft.WebMediaExtensions'
    'Microsoft.WebpImageExtension'
    'Microsoft.Windows.Photos'
    'Microsoft.WindowsAlarms'
    'Microsoft.WindowsCalculator'
    'Microsoft.WindowsCamera'
    'microsoft.windowscommunicationsapps'
    'Microsoft.WindowsFeedbackHub'
    'Microsoft.WindowsMaps'
    'Microsoft.WindowsSoundRecorder'
    'Microsoft.WindowsStore'
    'Microsoft.Xbox.TCUI'
    'Microsoft.XboxApp'
    'Microsoft.XboxGameOverlay'
    'Microsoft.XboxGamingOverlay'
    'Microsoft.XboxIdentityProvider'
    'Microsoft.XboxSpeechToTextOverlay'
    'Microsoft.YourPhone'
    'Microsoft.ZuneMusic'
    'Microsoft.ZuneVideo'
    'Microsoft Edge'
    'Microsoft.BingTranslator'
    'Microsoft.BingSports'
    'Microsoft.BingNews'
    'Microsoft.Appconnector'

)

Write-Output "`n`n 1) Uinstalling APPS from System"

foreach($package in $packages)
{
    Get-AppxPackage -Name $package | Remove-AppxPackage | Out-Null
    Start-Sleep -Seconds 5
}
Start-Sleep -Seconds 2

############################################### Disabling APP AutoUpdater ##########################################################
cls
Write-Output "`n`n 2) Tweaking App Settings......`n"
Start-Sleep -Seconds 3
New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsStore' -ItemType Directory -Force | Out-Null
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsStore' -Name AutoDownload -Value 2 -PropertyType DWord | Out-Null

############################################# Adjusting Content Delivery Manager ####################################################
$cdm = @(
    "ContentDeliveryAllowed"
    "FeatureManagementEnabled"
    "OemPreInstalledAppsEnabled"
    "PreInstalledAppsEnabled"
    "PreInstalledAppsEverEnabled"
    "SilentInstalledAppsEnabled"
    "SubscribedContentEnabled"
    "SystemPaneSuggestionsEnabled"
    "SilentInstalledAppsEnabled"
)

New-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -ItemType Directory -Force | Out-Null
Start-Sleep -Seconds 1
foreach($ele in $cdm)
{
    New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name "$ele" -Value 0 -PropertyType DWord -Force | Out-Null
    Start-Sleep -Seconds 2
}
Write-Output "`n  ALL DONE !!!`n"