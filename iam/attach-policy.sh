#!/bin/bash
USERNAME="newuser"
aws iam attach-user-policy --user-name $USERNAME \
  --policy-arn arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess