#Runs sql query

param(
[Parameter(Mandatory = $true)]
[string]$sqlquery = "",
[Parameter(Mandatory = $true)]
[string]$serverInstance = "",
[Parameter(Mandatory = $true)]
[string]$dbName = "",
[string]$username,
[string]$password
)
$currentLocation = get-location

$fullSQLQuery = "USE ["+$dbName+"];"+$sqlquery

if($username -And $password){
    Invoke-Sqlcmd -Query $fullSQLQuery -ServerInstance $serverInstance -U $username -P $password
}
else{
    Invoke-Sqlcmd -Query $fullSQLQuery -ServerInstance $serverInstance
}

cd $currentLocation