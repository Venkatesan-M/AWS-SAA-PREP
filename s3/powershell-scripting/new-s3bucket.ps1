Import-Module AWS.Tools.S3

$region = "us-east-1"

$bucketName = Read-Host -Prompt 'Enter the S3 Bucket Name'

Write-Host "AWS S3 Bucket Region: $region"
Write-Host "AWS S3 Bucket Name: $bucketName"

New-S3Bucket -BucketName $bucketName -Region $region