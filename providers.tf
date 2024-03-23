terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
  # backend "remote" {
  #   organization = "example_corp"

  #   workspaces {
  #     name = "media-wiki-prod"
  #   }
  # }
}


provider "azurerm" {
  features {}
}