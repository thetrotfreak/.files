$candidatePackages = Get-AppxPackage -AllUsers | Select-Object -Property Name, PackageFullName, NonRemovable | Where-Object -Property NonRemovable -Match 'False'

Write-Host "Found $($candidatePackages.Length) removable packages!" -ForegroundColor Yellow

$candidatePackages | ForEach-Object -Process {
    Write-Host -ForegroundColor Blue "`nRemove $($_.Name)?"
    $action = "y"
    $defaultAction = "N"
    $prompt = "$action/$defaultAction"
    $promptValue = (Read-Host -Prompt $prompt)
    if ($promptValue -ieq $action) {
        Remove-AppPackage -AllUsers -Package $_.PackageFullName
        Write-Host -ForegroundColor Green "Removed"
    }
    else {
        Write-Host -ForegroundColor Yellow "Skipped"
    }
}
