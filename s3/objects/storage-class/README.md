

## Setup AWS S3 Bucket

### 1. Create a new AWS S3 bucket

```sh
    aws s3 mb s3://storage-classes-aws-prep
```

### 2. Create a file

```sh
    echo "Hello S3 Storage" > storage.txt
    aws s3 cp storage.txt s3://storage-classes-aws-prep
```

### 3. Specify Storage Class for the Object

`--storage-class` (string) 
The type of storage to use for the object, Defaults to `STANDARD` 
Valid choices are: 

- `STANDARD`
- `REDUCED_REDUNDANCY`
- `STANDARD_IA`
- `ONEZONE_IA`
- `INTELLIGENT_TIERING`
- `GLACIER`
- `DEEP_ARCHIVE`
- `GLACIER_IR`

### 4. upload in Standard IA Class by

```sh
    aws s3 cp storage.txt s3://storage-classes-aws-prep --storage-class="STANDARD_IA"
```

### 5. Cleanup: 

- Delete Objects in a Bucket

    ```sh
        aws s3 rm s3://storage-classes-aws-prep --recursive
    ```


- Delete the Bucket


    ```sh
        aws s3 rb s3://storage-classes-aws-prep
    ```