#!/bin/bash

# Define your Azure Blob Storage information
AZURE_STORAGE_ACCOUNT="samplesharepoint"
AZURE_CONTAINER_NAME="sharepointcontainer"
AZURE_STORAGE_ACCOUNT_KEY="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"  # Replace with your storage account key

# Specify the local folder path
sourceFolderPath="temp"

# Copy files from the local folder to Azure Blob Storage using AzCopy with the storage account key
azcopy copy "$sourceFolderPath" "https://$AZURE_STORAGE_ACCOUNT.blob.core.windows.net/$AZURE_CONTAINER_NAME" --recursive

# Check if the copy operation was successful
if [ $? -eq 0 ]; then
  echo "Folder $sourceFolderPath uploaded successfully to $AZURE_CONTAINER_NAME"
else
  echo "Failed to upload $sourceFolderPath"
fi
