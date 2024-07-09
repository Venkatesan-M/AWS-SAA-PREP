# Pulumi 

## Download & install [Pulum](https://www.pulumi.com/docs/install/)

1. one line script install for linux systems.

    ```
        curl -fsSL https://get.pulumi.com | sh
    ```

- Refresh your bash by

    ```
        . ~/.bashrc
    ```

    if this not working, add pulumi to the path.

2. Add Pulumi to your path.

    For Windows and macOS systems, the PATH environment variable is automatically set by using the automatic installation commands. In this case, skip this step. For Linux systems, run the following command to add Pulumi to your path:

    ```
        export PATH=$PATH:$HOME/.pulumi/bin
    ```

3. Verify whether Pulumi is installed.

    ```
        pulumi version
    ```
4. Pulumi command manual

    ```
        pulumi
    ```

# Set up a Pulumi Project

you can create pulumi projects with `pulumi new project-template` command, replace `project-template` with the template, to list the available Pulumi Project templates run `pulumi new -l`

## Creating a Pulumi aws python project

1. create a project in a empty directy like `pulumi-pypro` by running

    ```
        pulumi new aws-python
    ```

    Generate a [access token](https://app.pulumi.com/account/tokens) for the project
