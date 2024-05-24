<div id="header" align="center">
  <img src="https://media.giphy.com/media/OF0yOAufcWLfi/giphy.gif?cid=ecf05e47o7i2m6n7cfpruz5v1n9j7i4bnxbhmr1zgrxajiqt&ep=v1_gifs_search&rid=giphy.gif&ct=g" width="200"/>
  <div id="badges">
    <a href="https://www.linkedin.com/in/ali-koc-168462174/">
      <img src="https://img.shields.io/badge/LinkedIn-blue?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn Badge"/>
    </a>
    <a href="https://www.youtube.com/@Microsoft365alikoc">
      <img src="https://img.shields.io/badge/YouTube-red?style=for-the-badge&logo=youtube&logoColor=white" alt="Youtube Badge"/>
    </a>

## Intune BitLocker Recovery Keys Retrieval

This repository contains a PowerShell script to retrieve BitLocker recovery keys for all devices registered in Intune using Microsoft Graph API.

## Prerequisites

- PowerShell 7.x
- Azure AD App with the following API permissions:
  - `Device.Read.All`
  - `DeviceManagementManagedDevices.Read.All`
- Microsoft Graph PowerShell module

## Setup

1. **Create an Azure AD App:**
   - Log in to the Azure Portal.
   - Go to Azure Active Directory.
   - Navigate to "App registrations" and create a new app registration.
   - Grant necessary permissions to the app:
     - `Device.Read.All`
    
   ## Usage
# Clone this repository:

bash
Copy code
git clone https://github.com/yourusername/Intune-BitLocker-Recovery-Keys.git
cd Intune-BitLocker-Recovery-Keys
Open Retrieve-BitLockerKeys.ps1 and replace the following placeholders with your Azure AD app details:

# YOUR_TENANT_ID
# YOUR_CLIENT_ID
# YOUR_CLIENT_SECRET
Run the script:

powershell
Copy code
.\Retrieve-BitLockerKeys.ps1
The BitLocker recovery keys will be exported to BitLockerRecoveryKeys.csv in the same directory.

# Security
Ensure that the retrieved BitLocker recovery keys and the Azure AD app credentials are handled securely and accessed only by authorized personnel.
     - `DeviceManagementManagedDevices.Read.All`
   - Note down the `Client ID` and `Tenant ID`.
   - Generate a `Client Secret` and note it down.

2. **Install Microsoft Graph PowerShell Module:**
   ```powershell
   Install-Module -Name Microsoft.Graph -Scope CurrentUser
