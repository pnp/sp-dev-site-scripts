#
# Remove-SampleTheme.ps1
# Removes a custom theme
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

   [Parameter(HelpMessage='Theme name', Mandatory=$True)]
   [string] $ThemeName
)

# If credentials were not provided, get them now
if ($Credentials -eq $null) {
    $Credentials  = Get-Credential -Message 'Enter SharePoint Administrator Credentials'
}

# Connect to the SharePoint admin service
Connect-SPOService -Url $Url -Credential $Credentials

Remove-SPOTheme -Name $ThemeName


