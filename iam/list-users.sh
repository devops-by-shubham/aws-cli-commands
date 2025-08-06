#!/bin/bash
aws iam list-users --query "Users[*].[UserName,UserId,CreateDate]" --output table