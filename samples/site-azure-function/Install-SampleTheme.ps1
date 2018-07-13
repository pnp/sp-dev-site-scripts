#
# Install-SampleTheme.ps1
# Installs a custom theme
#

[CmdletBinding()]
[Diagnostics.CodeAnalysis.SuppressMessage('PSAvoidUsingPlainTextForPassword', '')]
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

function HashToDictionary {
  Param ([Hashtable]$ht)
  $dictionary = New-Object "System.Collections.Generic.Dictionary``2[System.String,System.String]"
  foreach ($entry in $ht.GetEnumerator()) {
    $dictionary.Add($entry.Name, $entry.Value)
  }
  return $dictionary
}

# Define the theme pallette
# JSON generated at https://developer.microsoft.com/en-us/fabric#/styles/themegenerator
$themepallette = HashToDictionary(
@{
    "themePrimary" = "#1593cc";
    "themeLighterAlt" = "#f2fafe";
    "themeLighter" = "#e5f5fc";
    "themeLight" = "#cbebfa";
    "themeTertiary" = "#92d5f4";
    "themeSecondary" = "#17a4e6";
    "themeDarkAlt" = "#1283b8";
    "themeDark" = "#0e668f";
    "themeDarker" = "#0b5070";
    "neutralLighterAlt" = "#f8f8f8";
    "neutralLighter" = "#f4f4f4";
    "neutralLight" = "#eaeaea";
    "neutralQuaternaryAlt" = "#dadada";
    "neutralQuaternary" = "#d0d0d0";
    "neutralTertiaryAlt" = "#c8c8c8";
    "neutralTertiary" = "#d6d6d6";
    "neutralSecondary" = "#474747";
    "neutralPrimaryAlt" = "#2e2e2e";
    "neutralPrimary" = "#333333";
    "neutralDark" = "#242424";
    "black" = "#1c1c1c";
    "white" = "#ffffff";
    "primaryBackground" = "#ffffff";
    "primaryText" = "#333333";
    "bodyBackground" = "#ffffff";
    "bodyText" = "#333333";
    "disabledBackground" = "#f4f4f4";
    "disabledText" = "#c8c8c8";
})

Add-SPOTheme -Name $ThemeName -Palette $themepallette -IsInverted $false


