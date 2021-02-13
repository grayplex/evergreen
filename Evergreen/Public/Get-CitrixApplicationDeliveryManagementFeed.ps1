Function Get-CitrixApplicationDeliveryManagementFeed {
    <#
        .SYNOPSIS
            Reads the public Citrix Application Delivery Management feed to return an array of versions and links to download pages.

        .NOTES
            Author: Aaron Parker
            Twitter: @stealthpuppy
        
        .EXAMPLE
            Get-CitrixApplicationDeliveryManagementFeed

            Description:
            Returns the available Citrix Application Delivery Management downloads.
    #>
    [OutputType([System.Management.Automation.PSObject])]
    [CmdletBinding()]
    Param()

    # Get application resource strings from its manifest
    $res = Get-FunctionResource -AppName "CitrixFeeds"
    Write-Verbose -Message $res.Name

    # Read the feed and filter for include and exclude strings and return output to the pipeline
    $gcfParams = @{
        Uri     = $res.Get.ApplicationDeliveryManagement.Uri
        Include = $res.Get.ApplicationDeliveryManagement.Include
        Exclude = $res.Get.ApplicationDeliveryManagement.Exclude
    }
    $Content = Get-CitrixRssFeed @gcfParams
    If ($Null -ne $Content) {
        Write-Output -InputObject $Content
    }
}
