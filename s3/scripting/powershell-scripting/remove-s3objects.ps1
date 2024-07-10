# Import the AWS Tools for PowerShell module
Import-Module AWS.Tools.S3

# Prompt user to enter the S3 Bucket Name
$bucketName = Read-Host -Prompt 'Enter the S3 Bucket Name'

# Display the entered bucket name
Write-Host "AWS S3 Bucket Name: $bucketName"

# List all objects in the S3 bucket
$objects = Get-S3Object -BucketName $bucketName

# Check if the bucket has objects
if ($null -eq $objects) {
    Write-Host "The bucket '$bucketName' is empty or does not exist."
} else {
    # Loop through each object and delete it
    foreach ($object in $objects) {
        $key = $object.Key
        try {
            Remove-S3Object -BucketName $bucketName -Key $key
            Write-Host "Object '$key' successfully deleted from bucket '$bucketName'."
        } catch {
            Write-Host "Failed to delete object '$key'. Error: $_"
        }
    }
    Write-Host "== All objects deleted from bucket '$bucketName' =="
}
