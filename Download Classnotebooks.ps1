# Check if the PowerShell modules are installed
Write-Host "Checking that the required PowerShell modules are installed, the required modules will be installed if they are missing." -ForegroundColor Green
# Check if PnP.PowerShell module is installed
try {
    if (Get-Module -ListAvailable -Name 'PnP.PowerShell') {
        Write-Host "The PnP.PowerShell Module is already installed"
    } 
    else {
        Write-Host "Now installing the PnP.PowerShell module"
        Install-Module -Name PnP.PowerShell -Force
    }
}
catch {
    write-host "Error: $($_.Exception.Message)" -foregroundcolor red
}
# Check if Microsoft.Online.SharePoint.PowerShell is installed
try {
    if (Get-Module -ListAvailable -Name 'PnP.PowerShell') {
        Write-Host "The PnP.PowerShell Module is already installed"
    } 
    else {
        Write-Host "Now installing the PnP.PowerShell module"
        Install-Module -Name PnP.PowerShell -Force
    }
}
catch {
    write-host "Error: $($_.Exception.Message)" -foregroundcolor red
}

Install-Module -Name Microsoft.Online.SharePoint.PowerShell

# Set PnP.PowerShell Connection Variables
$SPAdminUrl = 'https://52c5r0-admin.sharepoint.com' # Read-Host 'Enter the SharePoint admin URL (E.g. "https://contoso-admin.sharepoint.com")'

# Connect to the PnP.PowerShell Module
Write-Host "Connecting to PowesShell, enter SharePoint Admin credential when prompted. (Accept the permissions if this is this is the first time you are connecting to this tenant)" -foregroundcolor green
try {
    Connect-PnPOnline -Url $SPAdminUrl -Interactive
}
catch {
    write-host "Error: $($_.Exception.Message)" -foregroundcolor red
}

$AllSPSiteURLs = 

