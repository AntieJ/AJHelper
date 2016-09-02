#search by string

[CmdletBinding()]
Param(
[Parameter(Mandatory=$True)]
  [string]$Path,
  [Parameter(Mandatory=$True)]
  [string] $FileNameFilter,
  [Parameter(Mandatory=$True)]
  [string]$SearchString  
)

Get-ChildItem -path $Path -filter $FileNameFilter -Recurse| ForEach-Object{

    $searchOutput = Get-Content $_.FullName | Select-String -Pattern $SearchString

    if($searchOutput){
        $lineNumbers = ""
        $searchOutput | ForEach-Object{$lineNumbers=$lineNumbers+$_.LineNumber+", " }
        Write-Host "Line(s): " $lineNumbers.TrimEnd(", ") " at " $_.FullName
    }
}