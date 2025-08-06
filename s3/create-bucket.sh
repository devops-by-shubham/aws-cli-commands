#!/bin/bash
BUCKET_NAME="your-unique-bucket-name"
aws s3api create-bucket --bucket $BUCKET_NAME --region us-east-1