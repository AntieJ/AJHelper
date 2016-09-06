#AJHelper
#Wrapped ps scripts for easy use

#private
function RunCommand
{
    param(    
        [Parameter(Mandatory = $true)]
        [string]$relativeScriptLocation = ""    
    )

    $path = $PSScriptRoot+"\.."+$relativeScriptLocation
    & $path
}

#Public
function Start-SqlServices 
{
    RunCommand -relativeScriptLocation '\Service Restarter\sqlServiceStarter.ps1'
}

function RestartVpn 
{
    RunCommand -relativeScriptLocation '\Service Restarter\vpnrestart.ps1'
}

function StringSearch 
{
    RunCommand -relativeScriptLocation '\Search\directoryStringsearch.ps1'    
}

function SqlQuery 
{
    param(
    [string]$username,
    [string]$password
    )
    
    $path = $PSScriptRoot+"\.."+'\SQL\sqlQuery.ps1'

    if($username -And $password){
    write-host "username: " $username
        . $path -username $username -password $password
    }
    else{
        . $path
    }
}

#Register Functions
export-modulemember -function Start-SqlServices
export-modulemember -function RestartVpn
export-modulemember -function StringSearch
export-modulemember -function SqlQuery

#################################################################
#Resources

#How to Write a PowerShell Script Module
#https://msdn.microsoft.com/en-us/library/dd878340(v=vs.85).aspx

#Modifying the PSModulePath Installation Path
#https://msdn.microsoft.com/en-us/library/dd878326(v=vs.85).aspx