# AWS S3 SDK with Java

This project demonstrates how to use the AWS SDK for Java to interact with Amazon S3. The project is set up using Maven.

## Prerequisites

- Java Development Kit (JDK) 8 or later
- Apache Maven 3.6.0 or later
- AWS account with necessary permissions for S3 operations

## Getting Started

### 1. Clone the Repository

```sh
git clone https://github.com/Venkatesan-M/AWS-SAA-PREP.git
cd ./AWS-SAA-PREP/s3/sdk/java
```


# Creating a new [Maven Project for working with aws s3 java sdk](https://docs.aws.amazon.com/sdk-for-java/latest/developer-guide/setup-project-maven.html)

```sh
mvn -B archetype:generate \
 -DarchetypeGroupId=software.amazon.awssdk \
 -DarchetypeArtifactId=archetype-lambda -Dservice=s3 -Dregion=US_EAST_1 \
 -DarchetypeVersion=2.26.15 \
 -DgroupId=com.example.myapp \
 -DartifactId=myapp
```

# Delete the Maven Project by 

```
    rm -rf myapp/
```

# Refer Readme of the Maven Project for building the app

```
    ./myapp/README.md
```

# Clean the Build by

```
    mvn clean
```
