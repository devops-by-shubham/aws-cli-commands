#!/bin/bash
aws ec2 describe-instances \
  --query "Reservations[*].Instances[*].[InstanceId,State.Name,Tags[?Key=='Name']|[0].Value,InstanceType,PublicIpAddress]" \
  --output table