#!/bin/bash
aws logs get-log-events \
  --log-group-name "/aws/lambda/your-function" \
  --log-stream-name "2025/08/07/[$LATEST]xxxxx" \
  --limit 20