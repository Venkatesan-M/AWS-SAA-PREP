# AWS S3 Checksum Examples

This project demonstrates how to create an AWS S3 bucket, calculate various checksums [(MD5, CRC32, CRC32C, SHA1, SHA256)](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html), and upload files to the S3 bucket using these checksums.

headers can be used as a data integrity check to verify that the data received is the same data that was originally sent.

### Note: For directory buckets, when you use Amazon Web Services SDKs, `CRC32` is the default checksum algorithm that’s used for performance.


## Setup AWS S3 Bucket and Upload an Object

### 1. Create a new AWS S3 bucket

```sh
    aws s3 mb s3://checksums-example-aws-prep
```

### 2. Create a file to calculate checksums on

```sh
    echo "Hello World" > myfile.txt
```

### 3. Get an MD5 checksum of the file

```sh
    md5sum myfile.txt
```

### 4. Upload the file to the AWS S3 bucket

```sh
    aws s3 cp myfile.txt s3://checksums-example-aws-prep
```

### 5. Check the ETag of the uploaded file


```sh
    aws s3api head-object --bucket checksums-example-aws-prep --key myfile.txt
```

### Note: We will be putting objects with different checksums that are available by `aws s3api` [put-object](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/s3api/put-object.html).

## Steps for CRC32 Checksum

### 1. Install CRC32 and calculate the checksum

- Install `crc32`

    ```sh
        sudo apt-get install libarchive-zip-perl
    ```
- check checksum of a file by
    ```sh
        crc32 myfile.txt
    ```
### 2. Alternative: Using rhash

- Install `rhash`

    ```sh
        sudo apt install rhash -y
    ```
- check checksum of a file by
    ```sh
        rhash --crc32 --simple myfile.txt
    ```


### 3. Convert CRC32 checksum to Base64

- With `crc32`
    ```sh
        crc32 myfile.txt | xxd -r -p | base64
    ```
- With `rhash`
    ```sh
        rhash --crc32 --simple myfile.txt | xxd -r -p | base64
    ```

### 4. Upload the file with a CRC32 checksum to AWS S3

Replace `base64_crc32` with the actual Base64 encoded CRC32 checksum from the previous step.

```sh
aws s3api put-object \
--bucket="checksums-example-aws-prep" \
--key="myfilecrc32.txt" \
--body="myfile.txt" \
--checksum-algorithm="CRC32" \
--checksum-crc32="base64_crc32" # Replace base64_crc32 with crc32 base 64 value
```

`--checksum-crc32` (string) : This header specifies the base64-encoded, 32-bit CRC32 checksum of the object.

### 5. Expected Output
After running the above commands, you should see output similar to the following:

```json
{
    "ETag": "\"your_Etag_Value\"",
    "ChecksumCRC32": "your_base64_crc32_value",
    "ServerSideEncryption": "AES256"
}
```

### 6. Download the Uploaded File

You can download the file which you have put in the S3 with CRC32 Checksum by [get-object](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/s3api/get-object.html) or by running this command:

```sh
aws s3api get-object \
--bucket "checksums-example-aws-prep" \
--key "myfilecrc32.txt" \
myfilecrc32.txt
```

## Steps for CRC32C Checksum

### 1. rhash CRC32 and calculate the checksum

- Install `rhash`

    ```sh
        sudo apt install rhash -y
    ```
- check checksum of a file by
    ```sh
        rhash --crc32c --simple myfile.txt
    ```


### 2. Convert CRC32C checksum to Base64

```sh
    rhash --crc32c --simple myfile.txt | xxd -r -p | base64
```

### 3. Upload the file with CRC32C checksum to AWS S3

Replace `base64_crc32c` with the actual Base64 encoded CRC32C checksum obtained from the previous step.

```sh
aws s3api put-object \
--bucket="checksums-example-aws-prep" \
--key="myfilecrc32c.txt" \
--body="myfile.txt" \
--checksum-algorithm="CRC32C" \
--checksum-crc32-c="base64_crc32c" # Replace base64_crc32c with crc32c base64 value
```

`--checksum-crc32-c` (string) : This header specifies the base64-encoded, 32-bit CRC32C checksum of the object.

### 4. Expected Output
After running the above commands, you should see output similar to the following:

```json
{
    "ETag": "\"your_Etag_Value\"",
    "ChecksumCRC32C": "your_base64_crc32C_value",
    "ServerSideEncryption": "AES256"
}
```

### 5. Download the Uploaded File

You can download the file which you have put in the S3 with CRC32C Checksum by [get-object](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/s3api/get-object.html) or by running this command:

```sh
aws s3api get-object \
--bucket "checksums-example-aws-prep" \
--key "myfilecrc32c.txt" \
myfilecrc32c.txt
```

## Steps for SHA1 Checksum

### 1. Calculate SHA1 checksum

- Using `shasum`

    ```sh
        shasum myfile.txt
    ```
- Or using `openssl`
    ```sh
        openssl sha1 myfile.txt
    ```

### 2. Convert SHA1 checksum to Base64

- Using `shasum`

    ```sh
        shasum myfile.txt | awk '{print $1}' | xxd -r -p | base64
    ```
- Or using `openssl`
    ```sh
        openssl sha1 myfile.txt | awk '{print $2}' | xxd -r -p | base64
    ```

### 3. Upload the file with a SHA1 checksum to AWS S3
Replace `base64_sha1` with the actual Base64 encoded SHA1 checksum from the previous step.

```sh
aws s3api put-object \
--bucket="checksums-example-aws-prep" \
--key="myfilesha1.txt" \
--body="myfile.txt" \
--checksum-algorithm="SHA1" \
--checksum-sha1="base64_sha1" # Replace base64_sha1 with sha1 base 64 value
```

`--checksum-sha1` (string) : This header specifies the base64-encoded, 160-bit SHA-1 digest of the object.

### 4. Expected Output
After running the above commands, you should see output similar to the following:

```json
{
    "ETag": "\"your_Etag_Value\"",
    "ChecksumSHA1": "your_base64_sha1_value",
    "ServerSideEncryption": "AES256"
}
```

### 5. Download the Uploaded File

You can download the file which you have put in the S3 with SHA1 Checksum by [get-object](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/s3api/get-object.html) or by running this command:

```sh
aws s3api get-object \
--bucket "checksums-example-aws-prep" \
--key "myfilesha1.txt" \
myfilesha1.txt
```



## Steps for SHA-256 Checksum

### 1. Calculate SHA-256 checksum

- Using `sha256sum`

    ```sh
        sha256sum myfile.txt
    ```
- Or using `openssl`
    ```sh
        openssl dgst -sha256 myfile.txt
    ```

### 2.  Convert SHA-256 checksum to Base64

- Using `sha256sum`

    ```sh
        sha256sum myfile.txt | awk '{print $1}' | xxd -r -p | base64
    ```
- Or using `openssl`
    ```sh
        openssl dgst -sha256 myfile.txt | awk '{print $2}' | xxd -r -p | base64
    ```

### 3. Upload the file with a SHA-256 checksum to AWS S3
Replace `base64_sha256` with the actual Base64 encoded SHA-256 checksum from the previous step.

```sh
aws s3api put-object \
--bucket="checksums-example-aws-prep" \
--key="myfilesha256.txt" \
--body="myfile.txt" \
--checksum-algorithm="SHA256" \
--checksum-sha256="base64_sha256" # Replace base64_sha256 with sha256 base64 value
```

 `--checksum-sha256` (string) : This header specifies the base64-encoded, 256-bit SHA-256 digest of the object.

### 4. Expected Output
After running the above commands, you should see output similar to the following:

```json
{
    "ETag": "\"your_Etag_Value\"",
    "ChecksumSHA256": "your_base64_sha256_value",
    "ServerSideEncryption": "AES256"
}
```

### 5. Download the Uploaded File

You can download the file which you have put in the S3 with SHA256 Checksum by [get-object](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/s3api/get-object.html) or by running this command:

```sh
aws s3api get-object \
--bucket "checksums-example-aws-prep" \
--key "myfilesha256.txt" \
myfilesha256.txt
```

## Inference 

`--checksum-algorithm` (string)

Indicates the algorithm used to create the checksum for the object when you use the SDK. This header will not provide any additional functionality if you don’t use the SDK. 

When you send this header, there must be a corresponding `x-amz-checksum-*algorithm* ` or `x-amz-trailer` header sent. Otherwise, Amazon S3 fails the request with the HTTP status code `400 Bad Request`.

For the `x-amz-checksum-algorithm ` header, replace ` algorithm ` with the supported algorithm from the following list:

- CRC32
- CRC32C
- SHA1
- SHA256

For more information, see [Checking object integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html) in the Amazon S3 User Guide .

If the individual checksum value you provide through `x-amz-checksum-*algorithm* ` doesn't match the checksum algorithm you set through `x-amz-sdk-checksum-algorithm` , Amazon S3 ignores any provided ChecksumAlgorithm parameter and uses the checksum algorithm that matches the provided value in `x-amz-checksum-algorithm `.
