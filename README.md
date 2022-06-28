# Terraform Remote State Data Source Sample

This repo contains sample usage of [tfe_outputs](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/outputs) and [terraform_remote_state](https://www.terraform.io/language/state/remote-state-data) Data Sources and null_resource.

**tfe_outputs** is recommended to be used with Terraform Cloud/Enterprise, as it is more secure than **terraform_remote_state** Data Source, because it does not require full access to workspace state to fetch the outputs.

The code is using data source to get the output information from Terraform Cloud Workspace `terraform-random-pet` located in organization `hashicorp-test-peter`, that contains `random_pet` resource. The source code of the workspace is located [here](https://github.com/51r/terraform-random-pet) 

The use case of **terraform_remote_state** data source is inside the subdirectory `tfrs`

# Prerequisite
[Terraform Cloud](https://app.terraform.io/) Account, Organization and Workspace as a Source (https://github.com/51r/terraform-random-pet)
[Terraform CLI](https://www.terraform.io/downloads) as a destination (Current repo)

# How to use the repo
1. Clone the repo locally:
```
git clone https://github.com/51r/terraform_remote_state.git
```
I. The use case of `tfe_outputs` data source:

1. Make sure you are in the main directory of the repo:
```
cd terraform_remote_state
```

2. Initialize Terraform:
```
terraform init
```

3. Apply the plan:
```
terraform apply
```

II. The use case of `terraform_remote_state` data source:

1. Go into subdirectory tfrs
```
cd tfrs
```

2. Initialize Terraform:
```
terraform init
```

3. Apply the plan
```
terraform apply
```

Once you approve the plan execution, you can check the `terraform.tf` state file for the . The output prints the name of the pet resources generated from the source workspace. Due to changes in the data sources, when you print `value` atribute from the data source it's marked as sensitive and it is hidden, and you have to manually check the values from the state file:

```
grep names terraform.tfstate
```

The output should be the following:
```
"names": "key-duckling"
"names": "string"
```


