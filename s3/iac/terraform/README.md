# Terraform AWS S3 Setup

This project provides a simple example of using Terraform to create an S3 bucket in AWS.

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

## Installation

- You can install Terraform by running the following commands:

```bash
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt-get install -y terraform
```

- or you can just run the terraform_cli script file by


```
./terraform_cli
```
- to make it executable

```
chmod u+x terraform_cli
```

# Configuration

## The `main.tf` file uses the AWS provider from the Terraform registry:
- [AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest)

## The `s3.tf` file defines the AWS S3 resource:
- [AWS S3 Resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket)

### Here is an example configuration for creating an S3 bucket:


```tf
resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
```
### you can remove the line `bucket = "my-tf-test-bucket"` to allow Terraform to generate a random bucket name.


# Usage

1. Initialize the Terraform configuration. Run this command in the Terraform directory:

    ```
        terraform init
    ```
2. Apply the configuration to create the S3 bucket. When prompted, confirm the apply action by typing `yes`:

    ```
        terraform apply
    ```

# Cleanup

## To remove the created resources, run:

```
    terraform destroy
```
