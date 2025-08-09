#!/bin/bash
for region in $(aws ec2 describe-regions --query "Regions[*].RegionName" --output text)
do
  echo "Checking EC2 instances in region: $region"
  aws ec2 describe-instances --region $region --query "Reservations[*].Instances[*].InstanceId" --output text
done