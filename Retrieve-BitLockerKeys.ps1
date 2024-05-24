# Retrieve-BitLockerKeys.ps1
# PowerShell script to retrieve BitLocker recovery keys for all devices registered in Intune

# It is recommended to use PowerShell 7.x

# Install necessary module
Install-Module -Name Microsoft.Graph -Scope CurrentUser

# Authenticate with Microsoft Graph API
$tenantId = "YOUR_TENANT_ID"
$clientId = "YOUR_CLIENT_ID"
$clientSecret = "YOUR_CLIENT_SECRET"

# Obtain Access Token
$body = @{
    grant_type    = "client_credentials"
    scope         = "https://graph.microsoft.com/.default"
    client_id     = $clientId
    client_secret = $clientSecret
}
$tokenResponse = Invoke-RestMethod -Method Post -Uri "https://login.microsoftonline.com/$tenantId/oauth2/v2.0/token" -ContentType "application/x-www-form-urlencoded" -Body $body
$accessToken = $tokenResponse.access_token

# Retrieve devices
$uri = "https://graph.microsoft.com/v1.0/deviceManagement/managedDevices"
$headers = @{
    Authorization = "Bearer $accessToken"
}
$devicesResponse = Invoke-RestMethod -Uri $uri -Headers $headers -Method Get
$devices = $devicesResponse.value

# Retrieve BitLocker keys and export them
$bitlockerKeys = @()
foreach ($device in $devices) {
    $deviceId = $device.id
    $bitlockerUri = "https://graph.microsoft.com/v1.0/deviceManagement/managedDevices/$deviceId/recoveryKeys"
    $bitlockerResponse = Invoke-RestMethod -Uri $bitlockerUri -Headers $headers -Method Get
    foreach ($key in $bitlockerResponse.value) {
        $bitlockerKeys += [PSCustomObject]@{
            DeviceName    = $device.deviceName
            DeviceId      = $deviceId
            RecoveryKeyId = $key.id
            RecoveryKey   = $key.recoveryKey
        }
    }
}

# Save BitLocker keys to a CSV file
$bitlockerKeys | Export-Csv -Path "BitLockerRecoveryKeys.csv" -NoTypeInformation

Write-Host "BitLocker recovery keys successfully exported."
