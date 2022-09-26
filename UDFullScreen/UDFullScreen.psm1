$IndexJs = Get-ChildItem "$PSScriptRoot\index.*.bundle.js"
$AssetId = [UniversalDashboard.Services.AssetService]::Instance.RegisterAsset($IndexJs.FullName)

function New-UDFullScreen {
    <#
    .SYNOPSIS
    Creates a new component
    
    .DESCRIPTION
    Creates a new component
    
    .PARAMETER Id
    The ID of this editor

    .PARAMETER Text
    Text for the component

    .EXAMPLE
    New-UDFullScreen -Text 'Hello, world!'
    #>
    
    param(
        [Parameter()]
        [string]$Id = (New-Guid).ToString(),
        [Parameter()]
        [string]$ButtonFullScreenColor = "#7a7aff",
        [Parameter()]
        [string]$ButtonFullScreenHeight = "3em",
        [Parameter()]
        [string]$ButtonFullScreenWidth = "3em",
        [Parameter()]
        [string]$ButtonNormalScreenColor = "#7a7aff",
        [Parameter()]
        [string]$ButtonNormalScreenHeight = "3em",
        [Parameter()]
        [string]$ButtonNormalScreenWidth = "3em",
        [Parameter(Mandatory)]
        [scriptblock]$Content
    )

    End {
        @{
            assetId      = $AssetId 
            isPlugin     = $true 
            type         = "udfullscreen"
            id           = $Id

            buttonColor  = $ButtonFullScreenColor
            heightFull   = $ButtonFullScreenHeight
            widthFull    = $ButtonFullScreenWidth
            buttonScolor = $ButtonNormalScreenColor
            heightNormal = $ButtonNormalScreenHeight
            widthNormal  = $ButtonNormalScreenWidth
            content      = $Content.Invoke()

        }
    }
}