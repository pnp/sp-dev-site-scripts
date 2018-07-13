#
# Remove-SampleSiteDesign.ps1
# Removes a custom site design and script which runs a Flow
#

[CmdletBinding()]
[System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingPlainTextForPassword','')]
Param(
   [Parameter(Mandatory=$True, Position=1,
    HelpMessage='Admin site, such as https://mytenant-admin.sharepoint.com')]
   [string] $Url,	

   [Parameter(Mandatory=$true, ValueFromPipeline=$True,
    HelpMessage='Administrative credentials')]
   [object] $Credentials,

   [Parameter(HelpMessage='Site design name')]
   [string] $SiteDesignName = 'Sample department site',

   [Parameter(HelpMessage='Site script name')]
   [string] $SiteScriptName = 'Sample'
)

# If credentials were not provided, get them now
if ($Credentials -eq $null) {
    $Credentials  = Get-Credential -Message 'Enter SharePoint Administrator Credentials'
}

# Connect to the SharePoint admin service
Connect-SPOService -Url $Url -Credential $Credentials

# Show existing site designs
Get-SPOSiteDesign

# Clean up from any previous runs
Get-SPOSiteDesign | Where-Object {$_.Title -eq $SiteDesignName} | Remove-SPOSiteDesign
Get-SPOSiteScript | Where-Object {$_.Title -eq $SiteScriptName} | Remove-SPOSiteScript

# Show resulting site designs
Get-SPOSiteDesign