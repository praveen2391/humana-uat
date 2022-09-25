# Below steps are used for creating resources in azure using Terraform

## Pre-requisite:
- Terraform 1.0.11 binary (https://releases.hashicorp.com/terraform/1.0.11/)
- VsCode (https://code.visualstudio.com/download)
- az cli (https://azcliprod.blob.core.windows.net/msi/azure-cli-"version".msi)

### Note : To download the MSI installer for specific "version", change the version segment in URL

## Steps:
- Open azure portal in any browser and login with your credentials 
- Open Powershell/GitBash/CLI and type in below commands
    ```
    az login
    az account show
    az account set -s "<Name-Of-Subscription-OR-SubscriptionID"
    az account show
    ```
- Create a service principal with Contributor role and permissions to be used for creating the azure resources (personal login is should not be used to create resources , its not recommended)
    ```
    az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<SUBSCRIPTION_ID>"
    ```
- copy the secrets to terminal and export them as variables 
    ```
    {
  "appId": "xxxxxx-xxx-xxxx-xxxx-xxxxxxxxxx",
  "displayName": "azure-cli-2022-xxxx",
  "password": "xxxxxx~xxxxxx~xxxxx",
  "tenant": "xxxxx-xxxx-xxxxx-xxxx-xxxxx"
    }

    Set your environment variables

    $ export ARM_CLIENT_ID="<APPID_VALUE>"
    $ export ARM_CLIENT_SECRET="<PASSWORD_VALUE>"
    $ export ARM_SUBSCRIPTION_ID="<SUBSCRIPTION_ID>"
    $ export ARM_TENANT_ID="<TENANT_VALUE>"
    ```

    
