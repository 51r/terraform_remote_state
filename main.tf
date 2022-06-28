terraform {
  required_providers {
    random = {
      version = ">= 3.3.0"
    }
  }
  required_version = ">= 1.1.9"
}


data "tfe_outputs" "peter" {
  organization = "hashicorp-test-peter"
  workspace    = "test-azure-devops"
}

resource "null_resource" "pet" {
  provisioner "local-exec" {
    command = "echo ${data.tfe_outputs.peter.values.names}"
  }
}