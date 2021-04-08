#!/bin/bash

errcount=$(curl -s -f http://localhost:2020/api/v1/metrics/prometheus | grep fluentbit_output_retries_failed_total | awk '{print $2}'| tail -1)
if [ $errcount -gt 10 ]; then echo "Found ${errcount} output errors"; exit 1; fi