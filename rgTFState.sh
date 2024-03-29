#!/bin/bash
RESOURCE_GROUP_NAME="terraformMGMT"
STORAGE_ACCOUNT_NAME="tfstate$RANDOM"
CONTAINER_NAME="tfstate"
 
# Create resource group
az.cmd group create --name $RESOURCE_GROUP_NAME --location uksouth
 
# Create storage account
az.cmd storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob
  
# Get storage account key
ACCOUNT_KEY=$(az.cmd storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query [0].value -o tsv)
 
# Create blob container
az.cmd storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME --account-key $ACCOUNT_KEY
