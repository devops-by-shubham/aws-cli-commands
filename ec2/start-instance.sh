#!/bin/bash
INSTANCE_ID="i-xxxxxxxxxxxx"
aws ec2 start-instances --instance-ids $INSTANCE_ID