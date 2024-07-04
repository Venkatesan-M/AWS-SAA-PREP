# Import the AWS Tools for PowerShell module
Import-Module AWS.Tools.S3

# Function to sync local directory with S3 bucket
function Sync-LocalToS3 {
    param (
        [string]$localDir,
        [string]$bucketName
    )

    # Get all files in the local directory
    $files = Get-ChildItem -Path $localDir -File -Recurse

    foreach ($file in $files) {
        # Define the key for the S3 object
        $key = $file.FullName.Substring($localDir.Length + 1).Replace("\", "/")

        # Upload the file to the S3 bucket
        try {
            Write-S3Object -BucketName $bucketName -File $file.FullName -Key $key
            Write-Host "Uploaded $($file.FullName) to s3://$bucketName/$key"
        } catch {
            Write-Host "Failed to upload $($file.FullName). Error: $_"
        }
    }

    Write-Host "== Sync completed =="
}

# Prompt user to enter the local directory and S3 bucket name
$localDir = Read-Host -Prompt 'Enter the local directory'
$bucketName = Read-Host -Prompt 'Enter the S3 bucket name'

# Validate input
if (-not (Test-Path -Path $localDir)) {
    Write-Host "The specified local directory does not exist."
    exit 1
}

# Call the sync function
Sync-LocalToS3 -localDir $localDir -bucketName $bucketName
