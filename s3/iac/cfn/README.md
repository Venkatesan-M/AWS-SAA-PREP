# [AWS S3 Bucket Deployment with CloudFormation](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-s3-bucket.html)

This project provides a simple AWS CloudFormation template to create an S3 bucket. The repository includes scripts to deploy and delete the CloudFormation stack.

## Prerequisites

- AWS CLI installed and configured
- Bash shell

## Files

- `template.yaml`: CloudFormation template to create an S3 bucket.
- `deploy`: Bash script to deploy the CloudFormation stack.
- `delete-stack`: Bash script to delete the CloudFormation stack.

## **give execute permission to files**

```
    chmod u+x ./*
```

## to deploy a stack run:

```
    ./deploy
```

## to delete a stack run:

```
    ./delete-stack
```