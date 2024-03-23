# Install MediaWiki through Terraform and Ansible 


## Prerequisites

- Terraform
- Ansible
- Azure Cloud Account
- Service Principle details for automation
- Terraform Cloud for storing Backend
- Terraform Cloud Token

### Using Terraform cloud for storing backend , storage account can also be used

## SetUp credentials to run terraform

**Export** following variables with required value

- **ARM_CLIENT_ID**: The service principal client ID.
- **ARM_CLIENT_SECRET**: The service principal client secret.
- **ARM_TENANT_ID**: Your Azure tenant ID.
- **ARM_SUBSCRIPTION_ID**: Your Azure subscription ID.

## Azure resources to be created through terraform
- Resource Group
- Vnet
- Subnet
- Virtual Machine
- Public Ip
- Network Interface
- Network Security Groups
- Network Security Rules
- tls Private key

## Setup for terraform code 

- Change the `providers.tf` file to use your own `terraform cloud setup` 
- Change `organization` and `workspace` to be used to store state files
- Create a `terraform.tfvars` file to configure your own variables value to be used in terrafortm `(optional)`

## Setup for Ansible code
Update vars in mediawiki role as per the requirement .

## Initialise terraform 

Replace `YOUR_TF_CLOUD_TOKEN` with your own terraform cloud token

```
$ terraform init \
    -backend-config="token=<YOUR_TF_CLOUD_TOKEN>"
```

## Create a plan - dry run

```
$ terraform plan
```

## Apply the changes

```
$ terraform apply --auto-approve
```

### After successful run of the module you will be able to access mediawiki on "http://your-server-public-ip/mediawiki"

### Destroy the resources after testing

```
terraform destroy --auto-approve
```

### NOTE : 
- I have used dynamic inventory file but for single VM due to time constraint.
- Following best practices we can use **tags** to create and utilize **dynamic inventory**

- For **scaling** you may use `VMSS` and use LB to load balance traffic

### AZURE VAULT 

There are some sensitive values as well like **DB Password**
We can use **Azure Key Vault** or **Ansible Vault** for encrypting sensitive values

- echo 'my_vault_password' > .vault_pass
- echo '.vault_pass' >> .gitignore
- ansible-playbook --vault-password-file=.vault_pass -bK -i inventory.ini install-mediawiki.yml



