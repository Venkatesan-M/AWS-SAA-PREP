# Welcome to your [CDK](https://github.com/aws/aws-cdk) TypeScript project

This project demonstrates a CDK app with an instance of a stack (`CdkStack`) which contains an Amazon S3 bucket.

The `cdk.json` file tells the CDK Toolkit how to execute your app.

# CDK for S3

[Documentation](https://docs.aws.amazon.com/cdk/api/v2/docs/aws-cdk-lib.aws_s3.Bucket.html)

## Prerequisites

- AWS Account with necessary permissions
- [AWS CDK](https://docs.aws.amazon.com/cdk/latest/guide/getting_started.html)

## Setup

1. **Install AWS CDK**:
   If you haven't installed AWS CDK, you can do so by running:

    ```
        npm install -g aws-cdk
    ```

## Deploy this to your account:

### Bootstrap the Environment:

Before deploying the stack, you need to bootstrap your AWS environment:

```
    cdk bootstrap aws://YOUR_ACCOUNT_ID/YOUR_REGION
```

Replace `YOUR_ACCOUNT_ID` and `YOUR_REGION` with your actual AWS account ID and region.

### Deploy the CDK Stack:

Navigate to the project directory and deploy the stack:

```
    cdk deploy
```

## Cleanup

To remove the created resources, run:

```
    cdk destroy
```

This will delete the CloudFormation stack and all associated resources.

## Use the CDK Command-Line Toolkit to Interact with Your Project:

- `cdk deploy`: Deploys your app into an AWS account
- `cdk synth`: Synthesizes an AWS CloudFormation template for your app
- `cdk diff`: Compares your app with the deployed stack

## Other Useful Commands

- `npm run build`: Compile TypeScript to JavaScript
- `npm run watch`: Watch for changes and compile
- `npm run test`: Perform the Jest unit tests
