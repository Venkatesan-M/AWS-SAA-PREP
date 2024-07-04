# Import the AWS Tools for PowerShell module
Import-Module AWS.Tools.S3

# List all S3 buckets
$buckets = Get-S3Bucket

# Check if there are any buckets
if ($null -eq $buckets -or $buckets.Count -eq 0) {
    Write-Host "No S3 buckets found."
} else {
    Write-Host "List of S3 Buckets:"
    foreach ($bucket in $buckets) {
        Write-Host $bucket.BucketName
    }
}
