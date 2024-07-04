# Ruby AWS S3 SDK Example

This project demonstrates how to use the AWS S3 SDK with Ruby to create an S3 bucket and upload files to it. 

## Prerequisites

- Ruby installed on your machine.
    ```
    ruby -v
    ```
- AWS credentials configured on your machine (either through environment variables, shared credentials file, or IAM role if running on AWS EC2).
- `bundler` gem installed (`gem install bundler`).

## Setup

1. **Clone the repository** (if applicable) or navigate to your project directory.

    ```
        git clone https://github.com/Venkatesan-M/AWS-SAA-PREP.git
        cd ./AWS-SAA-PREP/s3/sdk/ruby
    ```

2. **Install the required gems**:

    ```bash
    bundle install
    ```

## Running the Script

1. **Set the `BUCKET_NAME` environment variable**:

    ```bash
    export BUCKET_NAME='Your-Sample-Ruby-S3-SDK-Bucket-Name'
    ```

2. **Run the script**:

    ```bash
    bundle exec ruby s3.rb
    ```

## Script Explanation

The script performs the following tasks:

1. **Imports required libraries**:
    - `aws-sdk-s3`: AWS SDK for S3.
    - `pry`: A runtime developer console and IRB alternative with powerful introspection capabilities.
    - `securerandom`: Module for generating UUIDs.

2. **Fetches the S3 bucket name** from the `BUCKET_NAME` environment variable.

3. **Defines the AWS region**.

4. **Initializes the S3 client** with the specified region.

5. **Creates the S3 bucket**:
    - If the bucket already exists and is owned by the user, it skips the creation.
    - If a service error occurs, it prints the error message and exits.

6. **Generates a random number of files (between 1 and 3)** to upload to the S3 bucket.

7. **Creates and uploads each file**:
    - Creates a temporary file with a random UUID as content.
    - Uploads the file to the specified S3 bucket.
    - Deletes the temporary file after upload.

## Dependencies

- `aws-sdk-s3`: AWS SDK for Ruby to interact with Amazon S3.
- `pry`: A runtime developer console.
- `nokogiri`: A Ruby gem for parsing HTML and XML.

## Example Output

```plaintext
Bucket Your-Sample-Ruby-S3-SDK-Bucket-Name created successfully.
Number of files to be uploaded: 3
Uploading file number: 1
Uploading file number: 2
Uploading file number: 3
All files uploaded successfully.
