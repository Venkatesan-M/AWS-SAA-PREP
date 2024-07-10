# AWS S3 Metadata Examples

This project demonstrates how to create an AWS S3 bucket, set Metadata for an object.

 Note: ou cannot use PutObject to only update a single piece of metadata for an existing object. You must put the entire object with updated metadata if you want to update some values.

## Setup AWS S3 Bucket

### 1. Create a new AWS S3 bucket

```sh
    aws s3 mb s3://metadata-examples-aws-prep
```
### 2. Create a new file with Random metadata

```sh
    touch -a -t 201611161200.10 metadatafile.txt
    echo "Hello Mars!" > metadatafile.txt
```
It will result in modifing access timestamp, and replace it with date 2016-11-16 12:00:10.000000000 To change 'Modify' date you should use flag `-m`

### 3. Upload a file with Metadata

```sh
aws s3api put-object \
--bucket metadata-examples-aws-prep \
--key metadatafile.txt \
--body metadatafile.txt \
--metadata Planet=Earth
```

### 4. Get Metadata from head of the Object

```sh
aws s3api head-object \
--bucket metadata-examples-aws-prep \
--key metadatafile.txt 
```


### 5. Cleanup: 

- Delete Objects in a Bucket

    ```sh
        aws s3 rm s3://metadata-examples-aws-prep/ --recursive
    ```


- Delete the Bucket


    ```sh
        aws s3 rb s3://metadata-examples-aws-prep
    ```