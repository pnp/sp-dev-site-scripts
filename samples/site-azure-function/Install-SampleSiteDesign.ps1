#
# Install-SampleSiteDesign.ps1
# Installs a custom site design and a site script which runs a Flow
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
   [string] $SiteScriptName = 'Sample',

   [Parameter(HelpMessage='Description of site design and script')]
   [string] $Description = 'Sample departmental site',

   [Parameter(HelpMessage='URL of site logo', Mandatory=$True)]
   [string] $LogoUrl,

   [Parameter(HelpMessage='Theme name', Mandatory=$True)]
   [string] $ThemeName,

   [Parameter(HelpMessage='Flow Trigger Url', Mandatory=$True)]
   [string] $FlowTriggerUrl = ''
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

# Define a recipe and site design
$scriptJson = @"
{
    '$schema': 'schema.json',
    'actions': 
    [
        {
            'verb': 'setSiteLogo',
            'url': '${LogoUrl}'
        },
        {
            'verb': 'applyTheme',
            'themeName': '${ThemeName}'
        },
        {
            'verb': 'triggerFlow',
            'url': '${FlowTriggerUrl}',
            'name': 'Running Flow',
            'parameters': {
                'event': '',
                'product': ''
            }
        }
    ],
    'bindata': { },
    'version': 1
};
"@

Add-SPOSiteScript -Title $SiteScriptName -Description $Description -Content $scriptJson
$siteScript = Get-SPOSiteScript | Where-Object {$_.Title -eq $SiteScriptName} 

Add-SPOSiteDesign -Title $SiteDesignName -WebTemplate '68' -SiteScripts $siteScript -Description $Description


