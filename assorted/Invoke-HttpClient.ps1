
    [CmdletBinding()]
    param(
        [HttpClientAction]
        $Action,
        [pscredential]
        $Credential = [pscredential]::Empty
    )
    
    # Uncomment the following `if` block
    # if ($Credential.Equals([pscredential]::Empty)) {
    #     $Password = ConvertTo-SecureString -String "<PASSWORD GOES HERE>" -AsPlainText -Force
    #     $Credential = New-Object pscredential("USERNAME GOES HERE", $Password)
    # }

    $url = "http://192.168.100.100:8090/httpclient.html"

    $body = @{
        username     = $Credential.UserName
        a            = "" # UNIX Epoch in milliseconds
        producyttype = 0 # web client is 0
    }

    switch ($action) {
        ([HttpClientAction]::Login) {
            $body.mode = $Action.value__
            $body.password = ConvertFrom-SecureString -SecureString $Credential.Password -AsPlainText
        }
        ([HttpClientAction]::Logout) {
            $body.mode = $Action.value__
        }
    }

    try {
        $body.a = [System.DateTimeOffset]::UtcNow.ToUnixTimeMilliseconds()

        $response = Invoke-WebRequest -Uri $url -Method Post -Body $body -AllowUnencryptedAuthentication

        # log formatted XML content to a file
        $xmlFilePath = "$env:TEMP\httpclient.xml"
        (Format-XML -Xml $response.Content) | Out-File -FilePath $xmlFilePath

        # Parse XML content
        $xmlContent = [xml]$response.Content

        # Decode HTML entities in the message
        $decodedMessage = [System.Web.HttpUtility]::HtmlDecode($xmlContent.requestresponse.message.InnerText)

        if ($action -eq ([HttpClientAction]::Login)) {
            if ($xmlContent.requestresponse.status.InnerText -eq ([HttpClientStatus]::LIVE)) {
                # Replace {username} only for Login action & LIVE status
                $decodedMessage = $decodedMessage -replace '{username}', $Credential.UserName
                Write-Host -Message "✅ $decodedMessage" -ForegroundColor Green
            }
            elseif ($xmlContent.requestresponse.status.InnerText -eq ([HttpClientStatus]::LOGIN)) {
                Write-Host -Message "❌ $decodedMessage" -ForegroundColor Red
            }
        }
        elseif ($action -eq ([HttpClientAction]::Logout)) {
            if ($xmlContent.requestresponse.status.InnerText -eq ([HttpClientStatus]::LOGIN)) {
                Write-Host -Message "⚠️ $decodedMessage" -ForegroundColor Yellow
            }
        }
        # -Debug works only for
        # adavanced function with [CmdletBinding()]
        Write-Debug -Message "Logged to $xmlFilePath"
    }
    catch {
        # Handle web request errors
        Write-Error -Message $_.Exception.Message
    }
