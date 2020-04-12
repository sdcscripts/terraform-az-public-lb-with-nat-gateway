Public Load Balancer co-existing with NAT Gateway 
=================================================

This code will quickly (usually within 15 mins) build a simple deployment including a Public Load Balancer with two linux VMs in a backend configuration. The VMs are in a subnet which also has NAT Gateway configured.

There is a simple web service on each Linux which outputs the hostname

This lab demonstrates that public load balancer (inbound service) and NAT Gateway (outbound service) can co-exist. Note that for all outbound connectivity, NAT Gateway will take precedence. All inbound flows will use the Public load balance and flow symmetry will be maintained.

## Requirements

* terraform core 0.12.n
* tested with terraform AzureRM provider `2.40.0` (this version will be downloaded during ```terraform init```)
* an authenticated connection to an azure subscription (if you run terraform apply from a session that is logged in using ```az cli``` terraform will use the connection. Alternatives include a service principle, or managed identity. More information found here: <https://www.terraform.io/docs/providers/azurerm/guides/azure_cli.html>)


> Deploying this module will incur cost in your subscription!


The key points and features are:

- **Easy Run**: Running this module is a simple "5 commands" process.

1. ```git clone``` the repository
2. Rename ```terraform.tfvars.example``` to ```terraform.tfvars``` (if you wish to use the variable values suggested in the file. You can edit this file if you wish before applying the configuration)
3. Edit ```terraform.tfvars``` and add the VM password you wish to use 
4. ```terraform init``` to initialise the terraform environment
5. ```terraform apply``` to apply the configuration to your Azure environment

This will deploy the environment to Azure. 

You can run ```terraform destroy``` when you are finished.

- **Public Load Balancer**: The public load balancer is deployed and rules set to load balance to the two linux VMs in a single subnet. 

* **Network Security Group**: This deployment will automatically attach an NSG rule to the subnet to allow SSH direct to the Linux VMs from the Internet, be aware of this, you may wish to disallow this and set up alternative methods to remote to the VM such as Azure Bastion, VPN or Expressroute.

- **NAT Gateway**: NAT Gateway is fully configured and operational.

- **Terraform Outputs** Terraform will output the DNS label for the public load balancer, DNS labels for the two Linux VMs and also the username\password to connect to the VMs.

Terraform Getting Started & Documentation
-----------------------------------------

If you're new to Terraform and want to get started creating infrastructure, please checkout our [Getting Started](https://www.terraform.io/intro/getting-started/install.html) guide, available on the [Terraform website](http://www.terraform.io).

All documentation is available on the [Terraform website](http://www.terraform.io):

  - [Intro](https://www.terraform.io/intro/index.html)
  - [Docs](https://www.terraform.io/docs/index.html)