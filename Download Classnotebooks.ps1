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

# Set PnP.PowerShell Connection Variables
$SPAdminUrl = 'https://52c5r0-admin.sharepoint.com' # Read-Host 'Enter the SharePoint admin URL (E.g. "https://contoso-admin.sharepoint.com")'

# Set local download directory
$BaseDownloadDir = 'C:\IT\Class Notebook Export\'

# Connect to the PnP.PowerShell Module
Write-Host "Connecting to PowesShell, enter SharePoint Admin credentials when prompted. (Accept the permissions if this is this is the first time you are connecting to this tenant)" -foregroundcolor green
try {
    Connect-PnPOnline -Url $SPAdminUrl -Interactive
    Write-Host "Successfully connect to $SPAdminUrl" -ForegroundColor Green
}
catch {
    write-host "Error: $($_.Exception.Message)" -foregroundcolor red
}

# Get Base SP URL
$BaseSPURL = $SPAdminUrl.Replace("-admin", "")

# Load all applicable Site URLs into a variable
TODO would it be better to load all of the SP URLs for the sites where we know we need to download the class notebooks?
$AllSPSiteURLs = Get-PnPTenantSite | Where-Object {(($_.Url -like $BaseSPURL + "/sites/*") -or ($_.Url -like $BaseSPURL +  "/teams/*")) -and ($_.Url -notlike $BaseSPURL + "/sites/appcatalog*")}

TODO Add in the function to download teh contents of a SP folder
TODO Call the above function in a ForEach loop parsing in the $SPDownloadURL that is created from the below
ForEach ($URL in $AllSPSiteURLs) {
    $SPDownloadURL = $BaseSPURL + '/' +  $URL.Url.Split("/")[-1] + '/' + '/path/to/class/notebook/'
    Write-Host $SPDownloadURL -ForegroundColor Cyan 
}


# TEST AREA - DO NOT RUN IN PROD
ForEach ($URL in $AllSPSiteURLs) {
    $SPDownloadURL = $BaseSPURL + '/' +  $URL.Url.Split("/")[-1] + '/' + '/path/to/class/notebook/'
    Write-Host $SPDownloadURL -ForegroundColor Cyan 
}