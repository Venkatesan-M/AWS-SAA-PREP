# AWS S3 Prefixes Examples

This project demonstrates how to create an AWS S3 bucket, calculate various prefixes

## Setup AWS S3 Bucket

### 1. Create a new AWS S3 bucket

```sh
    aws s3 mb s3://prefixes-examples-aws-prep
```

### 2. Create a Folder on AWS S3 Bucket

you can create a folder on S3 by `put-object` by specifing `/` at the end of the object name.

```sh
    aws s3api put-object --bucket prefixes-examples-aws-prep --key="folder/"
```
### 3. Upload a File to a Specific Folder
To upload a file to a specific folder, include the folder name in the key.

```sh
echo "Hello from folder" > myfile.txt
aws s3api put-object --bucket prefixes-examples-aws-prep --key="folder/myfile.txt" --body="myfile.txt"
```

### 4. List Objects in a Specific Folder
To list objects within a specific folder, use the `list-objects` command with the `--prefix` option.

```sh
aws s3api list-objects --bucket prefixes-examples-aws-prep --prefix "folder/"
```

### 5. Create Nested Folders
You can create nested folders by specifying a nested path as the key.

```sh
aws s3api put-object --bucket prefixes-examples-aws-prep --key="folder/subfolder/"
```

### 6. Upload a File to a Nested Folder
To upload a file to a nested folder, include the nested folder path in the key.

```sh
echo "Hello from subfolder" > myfile_sub.txt
aws s3api put-object --bucket prefixes-examples-aws-prep --key="folder/subfolder/myfile_sub.txt" --body="myfile_sub.txt"
```

### 7. List Objects in a Nested Folder
To list objects within a nested folder, use the `list-objects` command with the `--prefix option`.

```sh
aws s3api list-objects --bucket prefixes-examples-aws-prep --prefix "folder/subfolder/"
```
### 8. Delete a Specific Object
To delete a specific object from a bucket, use the `delete-object` command.

```sh
aws s3api delete-object --bucket prefixes-examples-aws-prep --key="folder/subfolder/myfile_sub.txt"
```

### 9. Delete a Folder
To delete a folder and all its contents, use the `rm` command with the `--recursive` option.

```sh
aws s3 rm s3://prefixes-examples-aws-prep/folder/ --recursive
```

### 10. Cleanup: Delete the Bucket
To delete the bucket and all its contents, use the `rb` command with the `--force` option.

```sh
aws s3 rb s3://prefixes-examples-aws-prep --force
```