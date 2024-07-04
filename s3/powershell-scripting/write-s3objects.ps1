# Import the AWS Tools for PowerShell module
Import-Module AWS.Tools.S3

# Prompt user to enter the S3 Bucket Name
$bucketName = Read-Host -Prompt 'Enter the S3 Bucket Name'

# Display the entered bucket name
Write-Host "AWS S3 Bucket Name: $bucketName"

# Number of files to upload
$numFiles = 3

# Loop to create and upload multiple files
for ($i = 1; $i -le $numFiles; $i++) {
    $fileName = "myfile$i.txt"
    $fileContent = "Hello AWS S3 Bucket! This is file number $i."

    # Create the file with the specified content
    Set-Content -Path $fileName -Value $fileContent

    # Upload the file to the specified S3 bucket
    try {
        Write-S3Object -BucketName $bucketName -File $fileName -Key $fileName
        Write-Host "File '$fileName' successfully uploaded to bucket '$bucketName'."
    } catch {
        Write-Host "Failed to upload file '$fileName' to S3 bucket. Error: $_"
    }

    # Clean up by removing the local file
    Remove-Item -Path $fileName
    Write-Host "Local file '$fileName' deleted after upload."
}

Write-Host "All files have been uploaded to the bucket '$bucketName'."
