# AWS S3 ACLs Examples

This project demonstrates how to create an AWS S3 bucket and configure ACLs (Access Control Lists) to manage access.

## Setup AWS S3 Bucket

### 1. Create a new AWS S3 bucket

```sh
aws s3api create-bucket \
--bucket acls-aws-prep \
--region ap-southeast-1 \
--create-bucket-configuration \
LocationConstraint=ap-southeast-1
```

### 2. Turn off block public access for ACLs


```sh
aws s3api put-public-access-block \
--bucket acls-aws-prep \
--public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=true,RestrictPublicBuckets=true"
```

### 3. Verify block public access for ACLs

```sh
aws s3api get-public-access-block \
--bucket acls-aws-prep
```

### 4. Enable Object Ownership 

```sh
aws s3api put-bucket-ownership-controls \
--bucket acls-aws-prep \
--ownership-controls="Rules=[{ObjectOwnership=BucketOwnerPreferred}]"
```

### 5. Verify Object Ownership 
```sh
aws s3api put-bucket-ownership-controls \
--bucket acls-aws-prep
```

### 6. Change ACLs to allow for a user in another AWS Account

```sh
aws s3api put-bucket-acl --bucket acls-aws-prep --grant-full-control emailaddress=user1@example.com,emailaddress=user2@example.com --grant-read uri=http://acs.amazonaws.com/groups/global/AllUsers
```

## Additional ACL Operations
### 7. Grant read access to a specific user

```sh
aws s3api put-object-acl \
--bucket acls-aws-prep \
--key myfile.txt \
--grant-read emailaddress=user@example.com
```

### 8. Grant full control to the bucket owner

```sh
aws s3api put-object-acl \
--bucket acls-aws-prep \
--key myfile.txt \
--acl bucket-owner-full-control
```

### 9. Grant read access to the public

```sh
aws s3api put-object-acl \
--bucket acls-aws-prep \
--key myfile.txt \
--acl public-read
```
### 10. List bucket ACL

```sh
aws s3api get-bucket-acl \
--bucket acls-aws-prep
```

### 11. List object ACL

```sh
aws s3api get-object-acl \
--bucket acls-aws-prep \
--key myfile.txt
```

### 12. Cleanup: 

- Delete Objects in a Bucket

    ```sh
        aws s3 rm s3://acls-aws-prep --recursive
    ```


- Delete the Bucket


    ```sh
        aws s3 rb s3://acls-aws-prep
    ```