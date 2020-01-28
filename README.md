# Terraform 101

this is our terraform project.

terraform is a orchestration tool of deployment into the cloud and create the infrastructure.

-	it works with many providers, this is the first thing to configure is the provider it is using.

- it also uses different types of images and or provisioning

- in our stack we have :
  - chef (configuration manager)
  - packer (creates an immutable image of our machines)
  - terraform (is the orchestration tool which sets up the infrastructure in the cloud)

## Installing terraform

- download from website
- install using choco
- or you can create a path in the env variables

## Commands

**terraform init** - gets providers so it knows how to use it.
**terraform plan** - it plans and validates the configurations.
**terraform apply** - creates the instance (for enter a value click type yes)
**terraform refresh** - refreshs the state of the instance
**terraform destroy** - destroys the 
