# AWS Virtual Private Cloud (VPC) Basics

This document provides step-by-step instructions on how to create a Virtual Private Cloud (VPC) using the AWS CLI, along with creating an Internet Gateway (IGW), a Subnet, and setting up routing. It also includes the cleanup process to delete the created resources.

## Create VPC using Bash Scripting

The `create_vpc` bash Script is used to Create a VPC and `delete_vpc` bash Script is used to delete the VPC.

make the Bash Script Executable by:
```sh
chmod u+x ./create_vpc
chmod u+x ./delete_vpc
```

you can create the VPC by running:

```sh
./create_vpc
```

the following script will create a VPC with required Configuration. the output will look like

```sh
VPC_ID: your_vpc_id
IGW_ID: your_igw_id
SUBNET_ID: your_subnet_id
RT_ID: your_rt_id
ASSOC_ID: your_assoc_id
{
    "Return": true # If created
}
To delete the VPC Run the Below Command:
./delete_vpc your_vpc_id your_igw_id your_subnet_id your_assoc_id your_rt_id
```
This also output's the command which is required to delete the VPC. You can manually run the command as well but it requires these parameters.

```sh
./delete_vpc $VPC_ID $IGW_ID $SUBNET_ID $ASSOC_ID $RT_ID
```

## Create a vpc using aws cli

Every thing vpc comes under ec2
```sh
VPC_ID=$(aws ec2 create-vpc \
--cidr-block "172.1.0.0/16" \
--tag-specifications 'ResourceType=vpc,Tags=[{Key=Name,Value=my-vpc-1}]' \
--region ap-south-1  \
--query Vpc.VpcId \
--output text)
```

print the VPC ID

```sh
echo "VPC_ID: $VPC_ID"
```

Turn on DNS Hostnames
```sh
aws ec2 modify-vpc-attribute --vpc-id $VPC_ID --enable-dns-hostnames "{\"Value\":true}"
```

## Create an Internet Gateway

```sh
IGW_ID=$(aws ec2 create-internet-gateway \
--query InternetGateway.InternetGatewayId \
--output text
)

echo "IGW_ID: $IGW_ID"
```

## attach the Internet Gateway

```sh
aws ec2 attach-internet-gateway --internet-gateway-id $IGW_ID --vpc-id $VPC_ID
```

## create a new subnet
```sh
SUBNET_ID=$(aws ec2 create-subnet \
--vpc-id $VPC_ID \
--cidr-block 172.1.0.0/20 \
--query Subnet.SubnetId \
--output text)

echo "SUBNET_ID: $SUBNET_ID"
```
## Enable Auto-Assign Public IPv4 Addresses

```sh
aws ec2 modify-subnet-attribute --subnet-id $SUBNET_ID --map-public-ip-on-launch
```

## Get the Main Route Table ID and Associate it with the Subnet

```sh
RT_ID=$(aws ec2 describe-route-tables \
--filters "Name=vpc-id,Values=$VPC_ID" "Name=association.main,Values=true" \
--query "RouteTables[].RouteTableId[]" \
--output text)

echo "RT_ID: $RT_ID"

ASSOC_ID=$(aws ec2 associate-route-table \
--route-table-id $RT_ID \
--subnet-id $SUBNET_ID \
--query AssociationId \
--output text)

echo "ASSOC_ID: $ASSOC_ID"
```

## Add a Route to the Internet Gateway

```sh
aws ec2 create-route \
--route-table-id $RT_ID \
--destination-cidr-block 0.0.0.0/0 \
--gateway-id $IGW_ID
```


# Clean Up

## Detach the Internet Gateway

```sh
aws ec2 detach-internet-gateway --internet-gateway-id $IGW_ID --vpc-id $VPC_ID
```

## Delete the Internet Gateway

```sh
aws ec2 delete-internet-gateway --internet-gateway-id $IGW_ID
```

## Disassociate the Route Table

```sh
aws ec2 disassociate-route-table --association-id $ASSOC_ID
```

## Delete the Subnet
```sh
aws ec2 delete-subnet --subnet-id $SUBNET_ID
```

## Delete the Route Table
```sh
 # Only if it was created explicitly, the main route table cannot be deleted directly.
aws ec2 delete-route-table --route-table-id $RT_ID
 ```

##  Delete the VPC
```sh
aws ec2 delete-vpc --vpc-id $VPC_ID
```
