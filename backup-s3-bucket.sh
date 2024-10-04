#!/bin/bash

# Variables
SOURCE_BUCKET="your-source-bucket-name"
DESTINATION_BUCKET="your-destination-bucket-name"
REGION="your-region"

# Sync the source bucket to the destination bucket
aws s3 sync s3://$SOURCE_BUCKET s3://$DESTINATION_BUCKET --region $REGION

# Check if the sync was successful
if [ $? -eq 0 ]; then
  echo "Backup completed successfully."
else
  echo "Backup failed."
fi
