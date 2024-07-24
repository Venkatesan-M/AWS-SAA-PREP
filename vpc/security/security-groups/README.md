# Security Groups Setup Guide
This guide will help you set up Security Groups for your VPC in AWS. Follow these steps to configure and manage your sgs effectively.

## Get your VPC ID

replace Name with `your_vpc_name` with your vpc.

```sh
aws ec2 describe-vpcs \
    --filters "Name=tag:Name,Values=your_vpc_name" \
    --query "Vpcs[0].VpcId" \
    --output text
```


## Get AMI for Amazon Linux 2

Grab the latest AML2 AMI, Replace your Region in `--region` (e.g., `ap-south-1`).

```sh
aws ec2 describe-images \
--owners amazon \
--filters "Name=name,Values=amzn2-ami-hvm-*-x86_64-gp2" "Name=state,Values=available" \
--query "Images[?starts_with(Name, 'amzn2')]|sort_by(@, &CreationDate)[-1].ImageId" \
--region ap-south-1 \
 --output text
 ```

 ## Configure you `template.yml` file

Edit your template.yml file and set the following values:

- vpcid: Your VPC ID.
- subnetid: Your subnet ID.
- ami-id: The AMI ID obtained in the previous step.

 ## **give execute permission to files**
Run the following command to make your script files executable in the directory of the files.
```
    chmod u+x ./*
```

## to deploy a stack run:
Execute the deployment script:
```
    ./deploy
```


## Create a Security Group

```sh
aws ec2 create-security-group --group-name MySecurityGroup --description "My security group"
```


## to delete a stack run:
Execute the deletion script:
```
    ./delete-stack
```
Note: Don’t forget to delete the VPC if it’s no longer needed.
