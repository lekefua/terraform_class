# terraform_class

Guide: step by step process of Azure Authentication for Terraform Cloud and github

Firstly, make sure you have the following:

Azure Account
GitHub Account with a working repo
Terraform Cloud Account linked to the above Github account



Part 1: Create and retrieve Service Principal details in Azure
	
In the Azure Portal, navigate to the search bar and search “Subscriptions”. Click on the subscription you wish to use and take note of the Subscription ID


![image](https://github.com/gd-jackstraw/terraform_class/assets/143850151/a212ebc7-e84d-4512-a0ae-edcbaf2930dc)


Navigate to the search bar and enter “App Registrations” and select New Registration.


![image](https://github.com/gd-jackstraw/terraform_class/assets/143850151/ee0e184a-9456-4911-9500-1d2250203e2a)


Enter a name and register the app.


![image](https://github.com/gd-jackstraw/terraform_class/assets/143850151/36055641-854c-4234-af2b-8e5578cee080)


![image](https://github.com/gd-jackstraw/terraform_class/assets/143850151/eec60b13-9ea8-4df6-933c-16ab90fdd07c)


Take note of the following: Application (client) ID and Directory (tenant) ID


![image](https://github.com/gd-jackstraw/terraform_class/assets/143850151/387e4ac2-5038-4534-a7ea-00b91029ca12)


While on the “App Registrations” page, select your newly created app then navigate to the left hand menu and select “Certificates and secrets” and create a new client secret. Name it and copy the Value and keep it safe as you will not be able to retrieve it after leaving the page.


![image](https://github.com/gd-jackstraw/terraform_class/assets/143850151/1e9d61da-bc6b-4f28-89bf-bee8bb4b8552)


Finally, assign a role to the app by going back to “Subscriptions” and “Access control (IAM)” followed by "Add role assignment". 


![image](https://github.com/gd-jackstraw/terraform_class/assets/143850151/13aafe51-c661-433b-98f7-0ac66d2587af)


Select the Members tab and search for your new app and assign the role of “Contributor” to allow Terraform to make changes in Azure.


![image](https://github.com/gd-jackstraw/terraform_class/assets/143850151/7fe7eb37-1c9a-4b30-897a-3514ae4d5ccd)



Part 2: Setting up Terraform Cloud variables

In Terraform Cloud, navigate to the Variables section and create 4 new variables and enter the associated value for each that you got earlier from Azure:

subscription_id = Subscription ID
client_id = Application (client) ID
tenant_id = Directory (tenant) ID
client_secret = Value


![image](https://github.com/gd-jackstraw/terraform_class/assets/143850151/ec39ce68-1cb7-4f8c-b7f4-8c5fdef5cdd4)


Make sure to select "Sensitive" to hide sensitive data

Terraform Cloud will now have the correct authorization to communicate with Azure with the correct code in your provider file in your github repo. The last step is setting up a .tf file in that repo to declare you are using Azure and these values.



Part 3: Setting up your provider file in github

In your github repo, create a new .tf file and paste the following:


terraform{
  required_providers{
    azurerm={
      source="hashicorp/azurerm"
      version= ">=3.70.0"
    }
  }
  required_version=">=1.4.0"
}
 
provider "azurerm"{
  features{}
  skip_provider_registration="true"
  subscription_id=var.subscription_id
  client_id=var.client_id
  client_secret=var.client_secret
  tenant_id=var.tenant_id
}


![image](https://github.com/gd-jackstraw/terraform_class/assets/143850151/185a7b5d-5df5-4533-aad9-c6c2169fc9c6)



This bit of code is used to declare you are using Azure and to use the value in the variables to authenticate the actions Terraform Cloud will push to Azure.

Final step:

Add a main.tf file with any resource to test authentication. For example, the following code

resource "azurerm_resource_group" "tf-rg-philippe" {
  name     = "mcit_rg_philippe"
  location = "canadacentral"
}

![image](https://github.com/gd-jackstraw/terraform_class/assets/143850151/19dddef7-2b25-40f9-91e4-14a31bd72061)

