# AWS S3 Encryption Examples

This project demonstrates how to create an AWS S3 bucket and configure it with different encryption methods.

## Steps

### 1. Create a Bucket
First, create a new S3 bucket using the AWS CLI:
```sh
aws s3 mb s3://encryption-aws-prep
```

### 2. Create a File and upload
Create a sample file and upload it to the S3 bucket:
```sh
echo "This is a Encrypted File" > encryptedfile.txt
aws s3 cp encryptedfile.txt s3://encryption-aws-prep
```

### 3. Put Object with Server-Side Encryption (KMS)

To use AWS Key Management Service (KMS) for encryption, first get your KMS key ID:
```sh
aws kms list-keys
```

Replace `your-key-id`with the key ID you obtained from the above command:
```sh
aws s3api put-object \
--bucket encryption-aws-prep \
--key encryptedfile.txt \
--body encryptedfile.txt \
--server-side-encryption aws:kms \
--ssekms-key-id your-key-id
```

### 4. Put Object with Server-Side Encryption with Customer-Provided Keys (SSE-C)
Generate a Base64-Encoded Key and its MD5 Hash
```sh
export BASE64_ENCODED_KEY=$(openssl rand -base64 32)
export MD5_VALUE=$(echo -n "$BASE64_ENCODED_KEY" | base64 --decode | openssl dgst -md5 -binary | base64)
echo $BASE64_ENCODED_KEY, $MD5_VALUE
```

Upload the File with SSE-C
Use the generated key and hash to upload the file with SSE-C encryption:
```sh
aws s3api put-object \
--bucket encryption-aws-prep \
--key encryptedfile.txt \
--body encryptedfile.txt \
--sse-customer-algorithm "AES256" \
--sse-customer-key "$BASE64_ENCODED_KEY" \
--sse-customer-key-md5 "$MD5_VALUE"
```
### 5. Verify SSE-C Encryption
You cannot view SSE-C encryption details directly in the AWS console. To verify the encryption, use the AWS CLI to retrieve the object's metadata:

```sh
aws s3api head-object \
--bucket encryption-aws-prep \
--key encryptedfile.txt \
--sse-customer-algorithm "AES256" \
--sse-customer-key "$BASE64_ENCODED_KEY" \
--sse-customer-key-md5 "$MD5_VALUE"
```

### 6. Download the Encrypted Object
To download an object encrypted with SSE-C, you must provide the same encryption key and MD5 hash:

```sh
aws s3api get-object \
--bucket encryption-aws-prep \
--key encryptedfile.txt \
--sse-customer-algorithm "AES256" \
--sse-customer-key "$BASE64_ENCODED_KEY" \
--sse-customer-key-md5 "$MD5_VALUE" \
downloadedfile.txt
```

### 7. Cleanup: 

- Delete Objects in a Bucket

    ```sh
        aws s3 rm s3://encryption-aws-prep --recursive
    ```


- Delete the Bucket


    ```sh
        aws s3 rb s3://encryption-aws-prep
    ```