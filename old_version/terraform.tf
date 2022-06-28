terraform {
  required_providers {
    random = {
      version = ">= 3.3.0"
    }
  }
  required_version = ">= 1.1.9"
}

data "terraform_remote_state" "peter" {
  backend = "remote"

  config = {
    organization = "hashicorp-test-peter"
    workspaces = {
      name = "test-azure-devops"

    }
  }
}


resource "null_resource" "peter" {
  provisioner "local-exec" {
    command = "echo ${data.terraform_remote_state.peter.outputs.names}"
  }
}
