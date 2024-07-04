# Import the AWS Tools for PowerShell module
Import-Module AWS.Tools.S3

# Prompt the user to enter the bucket name
$bucketName = Read-Host -Prompt 'Enter the S3 Bucket Name'

# Get the list of objects in the specified bucket
$objects = Get-S3Object -BucketName $bucketName

# Check if there are any objects in the bucket
if ($null -eq $objects -or $objects.Count -eq 0) {
    Write-Host "No objects found in the bucket '$bucketName'."
} else {
    Write-Host "Objects in the bucket '$bucketName':"
    foreach ($object in $objects) {
        Write-Host "Key: $($object.Key), Last Modified: $($object.LastModified), Size: $($object.Size) bytes"
    }
}
