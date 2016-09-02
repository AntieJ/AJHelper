$sqlServices = Get-Service | Where-Object {$_.Name -like 'SQL*'}
foreach($service in $sqlServices){
    if($service.status -ne "Running"){
        $startServiceError = ""
        Write-host "Starting " $service.DisplayName     
           
        Start-Service $service.Name -erroraction SilentlyContinue -ErrorVariable startServiceError

        if($startServiceError -ne ""){
            Write-Host "Failed: " $startServiceError -ForegroundColor red
        }  
        else{
            Write-Host "Suceeded" -ForegroundColor Green
        }    
    }
}