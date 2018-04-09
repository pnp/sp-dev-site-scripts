# Configure Regional Settings for site

## Summary

You can use the `setRegionalSettings` action to configure the regional settings of the site (/_layouts/15/regionalsetng.aspx)

This sample illustrates how to use the setRegionalSettings site script action to configure the regional settings of a site. This action supports setting the following parameters: 

- Time Zone: a number specifying the time zone. For values see https://msdn.microsoft.com/library/microsoft.sharepoint.spregionalsettings.timezones.aspx
- Locale: a number specifying the culture by LCID. For values see https://msdn.microsoft.com/en-us/library/ms912047(v=winembedded.10).aspx
- Sort Order: a number specifying the sort order. For values see https://msdn.microsoft.com/en-us/library/microsoft.sharepoint.spregionalsettings.collation.aspx
- Time Format: a string specifying whether you want to use 12-hour time format or 24-hour format.

> Note that if a value is not specified, we do not overwrite the value already in the web.



## Sample

Solution|Author(s)
--------|---------
site-apply-regional-settings.json | SharePoint Team

## Version history

Version|Date|Comments
-------|----|--------
1.0|April 10, 2018|Initial release

## Disclaimer
**THIS CODE IS PROVIDED *AS IS* WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING ANY IMPLIED WARRANTIES OF FITNESS FOR A PARTICULAR PURPOSE, MERCHANTABILITY, OR NON-INFRINGEMENT.**

---



<img src="https://telemetry.sharepointpnp.com/sp-dev-site-scripts/site-apply-regional-settings" />