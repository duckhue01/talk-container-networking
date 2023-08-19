#!/bin/bash -e

. env.sh

# create an ec2 instance
aws ec2 run-instances \
  --image-id ami-0df7a207adb9748c7 \
  --instance-type t2.micro \
  --key-name dk \
  --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$INSTANCE_NAME}]" \
  --output text 1>/dev/null
