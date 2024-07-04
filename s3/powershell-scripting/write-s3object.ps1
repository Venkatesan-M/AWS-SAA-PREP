# Import the AWS Tools for PowerShell module
Import-Module AWS.Tools.S3

# Prompt user to enter the S3 Bucket Name
$bucketName = Read-Host -Prompt 'Enter the S3 Bucket Name'

# Display the entered bucket name
Write-Host "AWS S3 Bucket Name: $bucketName"

# Specify the file name and content
$fileName = "myfile.txt"
$fileContent = 'Hello AWS S3 Bucket!'

# Create the file with the specified content
Set-Content -Path $fileName -Value $fileContent

# Upload the file to the specified S3 bucket
try {
    Write-S3Object -BucketName $bucketName -File $fileName -Key $fileName
    Write-Host "File '$fileName' successfully uploaded to bucket '$bucketName'."
} catch {
    Write-Host "Failed to upload file to S3 bucket. Error: $_"
}

# Clean up by removing the local file
Remove-Item -Path $fileName
Write-Host "Local file '$fileName' deleted after upload."
