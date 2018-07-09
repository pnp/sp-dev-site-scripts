$webUrl = Get-Content $triggerInput -Raw

Connect-PnPOnline -url $webUrl -AppId $env:SPO_AppId -AppSecret $env:SPO_AppSecret

# Set up home page
# Section 1
$props = @'
{
  "layoutCategory": 1,
  "layout": 5,
  "content": [
    {
      "id": "e38b7aa6-a9cd-47eb-9ef2-efb5f7084bcf",
      "type": "UrlLink",
      "color": 4,
      "image": {},
      "description": "",
      "showDescription": false,
      "showTitle": true,
      "imageDisplayOption": 3,
      "isDefaultImage": true,
      "showCallToAction": true,
      "isDefaultImageLoaded": false,
      "isCustomImageLoaded": true,
      "previewImage": {}
    },
    {
      "id": "8adee762-0dc5-48fd-94ef-eb391e8ec58f",
      "type": "UrlLink",
      "color": 5,
      "image": {},
      "description": "",
      "showDescription": false,
      "showTitle": true,
      "imageDisplayOption": 2,
      "isDefaultImage": true,
      "showCallToAction": false,
      "isDefaultImageLoaded": false,
      "isCustomImageLoaded": true,
      "previewImage": {}
    },
    {
      "id": "cc618d86-dc33-4742-9df0-e2f714df1f78",
      "type": "UrlLink",
      "color": 4,
      "image": {},
      "description": "",
      "showDescription": false,
      "showTitle": true,
      "imageDisplayOption": 3,
      "isDefaultImage": true,
      "showCallToAction": false,
      "isDefaultImageLoaded": false,
      "isCustomImageLoaded": true,
      "previewImage": {}
    },
    {
      "id": "a1098565-46ce-45a3-ad6f-e2c350cd2ddc",
      "type": "UrlLink",
      "color": 4,
      "image": {},
      "description": "",
      "showDescription": false,
      "showTitle": true,
      "imageDisplayOption": 3,
      "isDefaultImage": true,
      "showCallToAction": false,
      "isDefaultImageLoaded": false,
      "isCustomImageLoaded": true,
      "previewImage": {}
    },
    {
      "id": "9d2f7147-4b93-478a-8e2a-c1d7d20356b2",
      "type": "UrlLink",
      "color": 4,
      "image": {},
      "description": "",
      "showDescription": false,
      "showTitle": true,
      "imageDisplayOption": 3,
      "isDefaultImage": true,
      "showCallToAction": false,
      "isDefaultImageLoaded": false,
      "isCustomImageLoaded": true,
      "previewImage": {}
    }
  ],
  "isFullWidth": true
}
'@

Add-PnPClientSidePageSection -Page "Home.aspx" -SectionTemplate OneColumn -Order 1
Add-PnPClientSideWebPart -Page "Home.aspx" -Section 1 -Column 1 -DefaultWebPartType Hero -WebPartProperties $props
Write-Output "Section 1 set up"

# Section 2
Add-PnPClientSidePageSection -Page "Home.aspx" -SectionTemplate TwoColumnLeft -Order 2
Add-PnPClientSideWebPart -Page "Home.aspx" -Section 2 -Column 1 -DefaultWebPartType NewsFeed
$props = '{"listQuery":"","title":"Frequently Needed","layoutMode":0,"hubLinksItems":[{"index":0,"Title":"Link","URL":null,"Description":"Description of Link","Icon":null,"NewTab":false,"GroupBy":""},{"index":null,"Title":"Link","URL":null,"Description":"Description of Link","Icon":null,"NewTab":false,"GroupBy":""},{"index":null,"Title":"Link","URL":null,"Description":"Description of Link","Icon":null,"NewTab":false,"GroupBy":""}],"groups":[],"version":"1.0"}'
Add-PnPClientSideWebPart -Page "Home.aspx" -Section 2 -Column 2 -Order 1 -Component "Hub Links List" -WebPartProperties $props
$props = '{"data":[{"name":"POLICIES","isBlue":true,"icon":"","url":"http://www.microsoft.com","openNew":false}],"title":"","advancedCamlQuery":""}'
Add-PnPClientSideWebPart -Page "Home.aspx" -Section 2 -Column 2 -Order 2 -Component "Hub Box Button" -WebPartProperties $props
$props = "{'listQuery':'','title':'About','layoutMode':0,'hubLinksItems':[{'index':null,'Title':'About Us','URL':'${$webUrl}About.aspx','Description':'About our department','Icon':'fa-book','NewTab':false,'GroupBy':''}],'groups':[],'version':'1.0'}"
Add-PnPClientSideWebPart -Page "Home.aspx" -Section 2 -Column 2 -Order 3 -Component "Hub Links List" -WebPartProperties $props
Write-Output "Section 2 set up"

#Section 3
Add-PnPClientSidePageSection -Page "Home.aspx" -SectionTemplate OneColumn -Order 3
Add-PnPClientSideWebPart -Page "Home.aspx" -Section 3 -Column 1 -DefaultWebPartType Events
$props = '{"title":"Site Owner","layout":1,"persons":[]}'
Add-PnPClientSideWebPart -Page "Home.aspx" -Section 3 -Column 1 -DefaultWebPartType People -WebPartProperties $props
Write-Output "Section 3 set up"

# Set up About page
Add-PnPClientSidePage -Name "About.aspx" -LayoutType Article -CommentsEnabled -PublishMessage "Published" -ErrorAction SilentlyContinue
Write-Output "About page set up"

# Set All Pages view
# Set up pages view
$context = Get-PnPContext
$list = Get-PnPList -Identity "Site Pages"
$view = Get-PnPView -List $list -Identity "All Pages"
Write-Output "All Pages view set up"

$view.ViewFields.Add("CheckoutUser")
$view.ViewFields.Add("Version")
$view.ViewQuery = '<GroupBy><FieldRef Name="PromotedState" Ascending="True" /></GroupBy>'
$view.Update()
$context.ExecuteQuery()

# Get title for output
$web = Get-PnPWeb
$title = $web.Title
Write-Output "Completed provisioning $title at $webUrl"