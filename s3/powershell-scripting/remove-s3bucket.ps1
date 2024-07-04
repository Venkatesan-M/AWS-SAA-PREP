Import-Module AWS.Tools.S3

$bucketName = Read-Host -Prompt 'Enter the S3 Bucket Name'

Write-Host "AWS S3 Bucket Name: $bucketName"

Remove-S3Bucket -BucketName $bucketName 