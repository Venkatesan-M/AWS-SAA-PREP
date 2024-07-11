# AWS S3 Bucket Policies Examples

This project demonstrates how to create an AWS S3 bucket and configure it's policies

## Setup AWS S3 Bucket

### 1. Create a new AWS S3 bucket

```sh
aws s3api create-bucket \
--bucket bucket-policies-aws-prep \
--region ap-southeast-1 \
--create-bucket-configuration \
LocationConstraint=ap-southeast-1
```

### 2. Create a Bucket Policy File

Create a file named `policy.json` with the following content to define your bucket policies:

```json
{
   "Statement": [
      {
         "Effect": "Allow",
         "Principal": "*",
         "Action": "s3:GetObject",
         "Resource": "arn:aws:s3:::MyBucket/*"
      },
      {
         "Effect": "Deny",
         "Principal": "*",
         "Action": "s3:GetObject",
         "Resource": "arn:aws:s3:::MyBucket/MySecretFolder/*"
      },
      {
         "Effect": "Allow",
         "Principal": {
            "AWS": "arn:aws:iam::123456789012:root"
         },
         "Action": [
            "s3:DeleteObject",
            "s3:PutObject"
         ],
         "Resource": "arn:aws:s3:::MyBucket/*"
      }
   ]
}
```

Replace `MyBucket` with your Bucket Name like `bucket-policies-aws-pre`

### 3. Apply the Bucket Policy
Use the following command to apply the policy to the S3 bucket:

```sh
aws s3api put-bucket-policy \
--bucket bucket-policies-aws-prep \
--policy file://policy.json
```

### 4. Verify the Bucket Policy
You can verify that the bucket policy has been applied correctly by retrieving the bucket policy with the following command:

```sh
aws s3api get-bucket-policy \
--bucket bucket-policies-aws-prep
```

### 5. Cleanup: 

- Delete Objects in a Bucket

    ```sh
        aws s3 rm s3://bucket-policies-aws-prep --recursive
    ```


- Delete the Bucket


    ```sh
        aws s3 rb s3://bucket-policies-aws-prep
    ```