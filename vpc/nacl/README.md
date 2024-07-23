# NACL (Network Access Control Lists) Setup Guide
This guide will help you set up Network Access Control Lists (NACLs) for your VPC in AWS. Follow these steps to configure and manage your NACLs effectively.

## Get your VPC ID

replace Name with `your_vpc_name` with your vpc.

```sh
aws ec2 describe-vpcs \
    --filters "Name=tag:Name,Values=your_vpc_name" \
    --query "Vpcs[0].VpcId" \
    --output text
```

## Create a NACL

Replace `your_vpc_id` with the VPC ID obtained in the previous step.
```sh
aws ec2 create-network-acl --vpc-id your_vpc_id
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

## Access your EC2 public IP

Check the public IP address of your EC2 instance to verify connectivity and ensure it is not being blocked.

## Block IP using NACL

To block an IP address, configure the inbound and outbound rules for your NACL. Replace `your_network_acl` with your NACL D and `your_ip` with the IP address you want to block.

```sh
aws ec2 create-network-acl-entry \
--network-acl-id your_network_acl \
--ingress \
--rule-number 100 \
--protocol -1 \
--port-range From=0,To=65535 \
--cidr-block your_ip/32 \
--rule-action deny
```
## Associate the NACL with a subnet:

To associate the NACL with a subnet, you will need to manually update the subnet association in the AWS Management Console or use the appropriate CLI command.

## to delete a stack run:
Execute the deletion script:
```
    ./delete-stack
```
Note: Don’t forget to delete the VPC if it’s no longer needed.