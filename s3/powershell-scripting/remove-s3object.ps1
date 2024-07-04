# Import the AWS Tools for PowerShell module
Import-Module AWS.Tools.S3

# Prompt user to enter the S3 Bucket Name
$bucketName = Read-Host -Prompt 'Enter the S3 Bucket Name'

# Prompt user to enter the S3 Object Key
$objectKey = Read-Host -Prompt 'Enter the S3 Object Key'

# Display the entered bucket name and object key
Write-Host "AWS S3 Bucket Name: $bucketName"
Write-Host "AWS S3 Object Key: $objectKey"

# Delete the specified object from the S3 bucket
try {
    Remove-S3Object -BucketName $bucketName -Key $objectKey
    Write-Host "Object '$objectKey' successfully deleted from bucket '$bucketName'."
} catch {
    Write-Host "Failed to delete object from S3 bucket. Error: $_"
}
