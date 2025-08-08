#!/bin/bash
FUNCTION_NAME="my-function"
ZIP_FILE="function.zip"

aws lambda update-function-code \
  --function-name $FUNCTION_NAME \
  --zip-file fileb://$ZIP_FILE