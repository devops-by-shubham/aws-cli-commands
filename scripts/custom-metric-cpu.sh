#!/bin/bash
CPU_UTIL=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
aws cloudwatch put-metric-data --metric-name CPUUtilization --namespace "CustomMetrics" --unit Percent --value $CPU_UTIL