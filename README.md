# AWS-SAA-PREP
A collection of example used fro AWS SAA PREP

# Congiure AWS CLI 

 - Set [Auto Complete](https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-parameters-prompting.html#:~:text=To%20configure%20auto%2Dprompt%20you,variables%20use%20the%20aws_cli_auto_prompt%20variable.) for Commands by
    ```
    export AWS_CLI_AUTO_PROMPT=on-partial
    ```

- Set [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html#envvars-list-aws_cli_auto_prompt) 

    1. By Setting Enviromental Variables

        - on your local Machine
            ```
                export AWS_ACCESS_KEY_ID=ReplaceWithYourAccessKey
                export AWS_SECRET_ACCESS_KEY=ReplaceWithYourSecretKey
                export AWS_DEFAULT_REGION=ReplaceWithYourClosestAWS-S3-Region
            ```
        - on your gitpod
            ```
                gp env AWS_ACCESS_KEY_ID=YourAccessKey
                gp env AWS_SECRET_ACCESS_KEY=YourSecretKey
                gp env AWS_DEFAULT_REGION=YourClosestAWS-S3-Region
            ```

    2. AWS Configure

        ```
        aws configure
        ```
- Check your Configuration by

    ```
        aws sts get-caller-identity
    ```
