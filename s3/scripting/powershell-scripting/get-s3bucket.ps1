# Import the AWS Tools for PowerShell module
Import-Module AWS.Tools.S3

# List all S3 buckets
$buckets = Get-S3Bucket

# Check if there are any buckets
if ($null -eq $buckets -or $buckets.Count -eq 0) {
    Write-Host "No S3 buckets found."
} else {
    # Sort buckets by CreationDate in descending order and select the most recent one
    $latestBucket = $buckets | Sort-Object -Property CreationDate -Descending | Select-Object -First 1

    Write-Host "Most Recently Created S3 Bucket:"
    Write-Host "Bucket Name: $($latestBucket.BucketName)"
    Write-Host "Creation Date: $($latestBucket.CreationDate)"
}
