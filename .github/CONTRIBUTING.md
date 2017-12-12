# Contribution Guidance
If you'd like to contribute to this repository, please read the following guidelines. Contributors are more than welcome to share your learnings with others from centralized location.

## Code of Conduct
This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information, see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/)
or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Question or Problem?
Please do not open GitHub issues for general support questions as the GitHub list should be used for feature requests and bug reports. This way we can more easily track actual issues or bugs from the code and keep the general discussion separate from the actual code. 

If you have questions about column formatting, feel also free to use following channels for having an open discussion with the community and engineering.

* [SharePoint Developer Space](http://aka.ms/SPPnP-Community) at http://techcommunity.microsoft.com
* [SharePoint Stack Exchange](http://sharepoint.stackexchange.com/) with 'spfx' tag

## Typos, Issues, Bugs and contributions
Whenever you are submitting any changes to the SharePoint repositories, please follow these recommendations.

* Always fork repository to your own account for applying modifications
* If you are submitting multiple samples, please create specific pull request for each of them
* If you are submitting typo or documentation fix, you can combine modifications to single pull request where suitable

## Submitting changes as pull requests
Here's a high level process for submitting new samples or updates to existing ones.

1. Sign the Contributor License Agreement (see below)
2. Fork the main repository to your GitHub account
3. Create a new branch for your fork for the contribution based on dev branch
4. Include your changes to your branch
5. Commit your changes using descriptive commit message - These are used to track changes on the repositories for monthly communications, see [October 2017](https://dev.office.com/blogs/PnP-December-2017-Release) as an example
6. Create a pull request in your own fork and target 'master' branch
7. Fill up the provided Pull Request template with the requested details

> note. Delete the feature specific branch only AFTER your pull request has been processed.

## Sample naming and structure guidelines
When you are submitting a new sample, it has to follow up below guidelines

- You will need to have a README file for your sample, which is based on [provided template](../samples/README-template.md) under the Samples folder. Please copy this template and update accordingly. README has to be named as README.md with capital letters.
    - You will need to have a picture of the sample in practice in the README file ("pics or it didn't happen"). Preview image should present how the site looks when provisioning is completed
- README template contains specific tracking image as a final entry in the page with img tag by default to https://telemetry.sharepointpnp.com/sp-dev-site-script/samples/readme-template. This is transparent image, which is used to track popularity of individual samples in GitHub.
    - Updated the image src element according with repository name and folder information. If your sample is for example in samples folder and named as react-todo, src element should be updated as https://telemetry.sharepointpnp.com/sp-dev-site-script/samples/flow-start
- When you are submitting new sample solution, please name the sample solution folder accordingly
    - Folder name should start by identifying if the site design uses flow or not - like "flow-", "site-"
    - After prefix, you should use description short term to define what script does like "site-create-list" 
    - Do not use terms like "script", "design", "template" in the folder name
- Do not use period/dot in the folder name of the provided sample
        
## Signing the CLA
Before we can accept your pull requests you will be asked to sign electronically Contributor License Agreement (CLA), which is prerequisite for any contributions to PnP repository. This will be one time process, so for any future contributions you will not be asked to re-sign anything. After the CLA has been signed, our PnP core team members will have a look on your submission for final verification of the submission. Please do not delete your development branch until the submission has been closed.

You can find Microsoft CLA from the following address - https://cla.microsoft.com. 

Thank you for your contribution.  

> Sharing is caring. 