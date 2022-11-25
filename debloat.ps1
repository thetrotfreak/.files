$y = "Y"
$n = "N"

foreach ($package in (Get-AppxPackage -AllUsers | Where-Object -Property NonRemovable -Match "False" | Select-Object -Property PackageFullName)) {

    $choice = (Read-Host -Prompt "`n? $($package.PackageFullName) ($y/$n)")
    if ($choice -eq $y) {
        Remove-AppxPackage -AllUsers -Package $package.PackageFullName
    }
    elseif ($choice -eq $n) {
        Write-Output "...skipping... $($package.PackageFullName)"
    }
    else {
    }
}

