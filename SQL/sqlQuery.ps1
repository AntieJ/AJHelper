#Runs sql query

param(
[Parameter(Mandatory = $true)]
[string]$sqlquery = "",
[Parameter(Mandatory = $true)]
[string]$serverInstance = "",
[Parameter(Mandatory = $true)]
[string]$dbName = ""
)
$currentLocation = get-location

$fullSQLQuery = "USE ["+$dbName+"];"+$sqlquery
Write-Host $fullSQLQuery
Invoke-Sqlcmd -Query $fullSQLQuery -ServerInstance $serverInstance

cd $currentLocation