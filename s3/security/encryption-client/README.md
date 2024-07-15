# AWS S3 Client Side Encryption Examples

This project demonstrates how to create an AWS S3 bucket and encrypt objects on the client side using Ruby.

## Prerequisites

- Ruby installed on your machine.
    ```
    ruby -v
    ```
- AWS credentials configured on your machine (either through environment variables, shared credentials file, or IAM role if running on AWS EC2).
- `bundler` gem installed (`gem install bundler`).

## Steps

### 1. Create a Bucket
First, create a new S3 bucket using the AWS CLI:
```sh
aws s3 mb s3://encryption-client-aws-prep
```

### 2. Create a File and upload
Create a sample file and upload it to the S3 bucket:
```sh
echo "This is a Encrypted File" > clientencryptedfile.txt
aws s3 cp clientencryptedfile.txt s3://encryption-client-aws-prep
```

### 3. Put Object with client-Side Encryption using ruby sdk

The `encrypt.rb` file contains the code to encrypt and upload files from client side. 

Change variables `bucket` and `file_key` to your requirements. 

To Execute the ruby file, Run:

```sh
bundle install
bundle exec ruby encrypt.rb
```

4. [Documentation update](https://docs.aws.amazon.com/sdk-for-ruby/v3/api/Aws/S3/EncryptionV2.html) 

S3 Encryption client is in maintenance mode and recommends using `Aws::S3::EncryptionV2::Client` instead of `Aws::S3::Encryption::Client`

```rb
s3 = Aws::S3::EncryptionV2::Client.new(
  encryption_key: key,
  key_wrap_schema: :rsa_oaep_sha1, # the key_wrap_schema must be rsa_oaep_sha1 for asymmetric keys
  content_encryption_schema: :aes_gcm_no_padding,
  security_profile: :v2 # use :v2_and_legacy to allow reading/decrypting objects encrypted by the V1 encryption client
)
```


### 5. Cleanup: 

- Delete Objects in a Bucket

    ```sh
        aws s3 rm s3://encryption-client-aws-prep --recursive
    ```


- Delete the Bucket


    ```sh
        aws s3 rb s3://encryption-client-aws-prep
    ```