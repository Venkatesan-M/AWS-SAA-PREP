# AWS S3 Static Website Hosting with CORS

This project demonstrates how to create an AWS S3 bucket, configure it for static website hosting, and set up CORS policy.

## Steps

### 1. Create a Bucket

```sh
aws s3 mb s3://cors-aws-prep
```

### 2. Change block public access

```sh
aws s3api put-public-access-block \
--bucket cors-aws-prep \
--public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```

### 3. Create a [Bucket policy](https://docs.aws.amazon.com/AmazonS3/latest/userguide/WebsiteAccessPermissionsReqd.html) for static website hosting

```sh
aws s3api put-bucket-policy --bucket cors-aws-prep --policy file://corspolicy.json
```

### 4. Turn on static website hosting

```sh
aws s3api put-bucket-website --bucket cors-aws-prep --website-configuration file://website.json
```

### 5. Upload your static website to your AWS S3 Bucket

```sh
aws s3 cp ./static-website s3://cors-aws-prep --recursive
```

The URL for the website is

```sh
OBJECT_KEY="index.html"
REGION="ap-south-1"
OBJECT_URL="https://${BUCKET_NAME}.s3.${REGION}.amazonaws.com/${OBJECT_KEY}"
echo ${OBJECT_URL}
```

Replace `OBJECT_KEY` & `REGION` with your values.]

### 6. Create API Gateway with mock response

```sh
curl -X POST https://dhwf1ldx0j.execute-api.ap-south-1.amazonaws.com/prod/moody \
     -H "Content-Type: application/json" \
     -d '{}'
```

Replace the URL with your gateway

### 7. Apply a CORS policy

Don't forget to update the API URL in Cors.json

```sh
aws s3api put-bucket-cors --bucket cors-aws-prep --cors-configuration file://cors.json
```

### 8. Cleanup: 

- Delete Objects in a Bucket

    ```sh
        aws s3 rm s3://cors-aws-prep --recursive
    ```


- Delete the Bucket


    ```sh
        aws s3 rb s3://cors-aws-prep
    ```