# AWS S3 PowerShell Scripting

This project demonstrates how to perform various operations on Amazon S3 using AWS Tools for PowerShell. The scripts cover creating, deleting, and listing buckets and objects, as well as uploading and syncing files.

## Prerequisites

- AWS Tools for PowerShell installed and configured with necessary permissions for S3 operations.
- PowerShell environment.
- [Auto Complete on PowerShell](https://techcommunity.microsoft.com/t5/itops-talk-blog/autocomplete-in-powershell/ba-p/2604524)

## [Installing PowerShell on Ubuntu (DEB)](https://learn.microsoft.com/en-us/powershell/scripting/install/install-ubuntu?view=powershell-7.4)

```
        sudo apt-get update
        sudo apt-get install -y wget apt-transport-https software-properties-common
        source /etc/os-release
        wget -q https://packages.microsoft.com/config/ubuntu/$VERSION_ID/packages-microsoft-prod.deb
        sudo dpkg -i packages-microsoft-prod.deb
        rm packages-microsoft-prod.deb
        sudo apt-get update
        sudo apt-get install -y powershell
```

- or you can just run the powershell_cli script file by


```
./powershell_cli
```
- to make it executable

```
chmod u+x powershell_cli
```

## Get into PowerShell by

```
        pwsh
```

## Setup PowerShell for AWS S3

```
        Install-Module -Name AWS.Tools.Installer -Force -Scope CurrentUser;
        Install-AWSToolsModule AWS.Tools.S3 -CleanUp -Force -Scope CurrentUser;   
```

## Setup

1. **Clone the repository** (if applicable) or navigate to your project directory.

    ```
        git clone https://github.com/Venkatesan-M/AWS-SAA-PREP.git
        cd ./AWS-SAA-PREP/s3/bash-scripting
    ```
2. **give execute permission to files**

    ```
        chmod u+x ./*
    ```
3. **Execution**
    - try executing with giving the required arguments

### Refer [PowerShell Scripting Documentation](https://docs.aws.amazon.com/powershell/latest/reference/items/S3_cmdlets.html) 