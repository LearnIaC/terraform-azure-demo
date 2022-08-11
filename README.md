# Terraform Azure Fullstack App Example

## Terraform initialization
The first step of preparing for initialization is to fill out two different `.tfvars` files.

### example.config.tfvars

This file stores configuration key/values for authenticating with Azure as well as storing Terraform state in Azure Storage so that multi-developer teams can work on the same codebase.

Make a copy of the `example.config.tfvars` file for each environment you plan to support and fill in the appropriate values for authenticating with and storing state files in Azure.

__This file should not be extended - it needs exactly the keys (with values) that are in the example file__

For example you may end up with three files such as:

* dev.config.tfvars
* stg.config.tfvars
* prd.config.tfvars

__The above files should not be checked into git because they contain sensitive secret values__

### example.infra.tfvars

This file stores key/values for actual infrastructure settings that may be reused across resources. 

Make a copy of the `example.infra.tfvars` file for each environment you plan to support and fill in the appropriate values for your infrastructure build.

__This file can be modified/extended to include any values that are required for your infrastructure build__

For example you may end up with three files such as:

* dev.infra.tfvars
* stg.infra.tfvars
* prd.infra.tfvars

__The above files should not be checked into git because they contain sensitive secret values__

### Run the initialization command
Once you've updated your tfvar files you can initialize your backend and state.

For example, to initialize the state for your `dev` environment you would run:
```
terraform init -backend-config dev.config.tfvars
```

## Terraform planning

When you have initialized your backend and state, you are ready to run a plan on your infrastructure configuration as defined in your various terraform (.tf) files.

For example, when you feel your configuration is in a good place to provision against your `dev` environment, you would run the following:
```
terraform plan --var-file="dev.config.tfvars" --var-file="dev.infra.tfvars"
```

You will be shown a printout of all the changes that Terraform plans to make if you proceed with applying your configuration to the cloud.

## Terraform applying

When you have ran a plan on your infrastructure configuration and are comfortable with the changes proposed, you are ready to run a `terraform apply` agains your configuration.


For example, when are ready to deploy your `dev` environment, you would run the following:
```
terraform apply --var-file="dev.config.tfvars" --var-file="dev.infra.tfvars"
```


