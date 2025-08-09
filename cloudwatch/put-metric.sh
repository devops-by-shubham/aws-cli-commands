#!/bin/bash
aws cloudwatch put-metric-data \
  --namespace "CustomMetrics" \
  --metric-name "PageLoadTime" \
  --unit Seconds \
  --value 2.34