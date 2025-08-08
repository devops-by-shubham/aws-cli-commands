#!/bin/bash
aws lambda invoke \
  --function-name my-function \
  --payload file://input.json \
  output.json

cat output.json