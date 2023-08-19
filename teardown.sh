#!/bin/bash -e

. env.sh

# Get the instance IDs by filtering instances with the specified Name tag
INSTANCE_IDS=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=$INSTANCE_NAME" --query "Reservations[].Instances[].InstanceId" --output text)

# Check if any instances were found with the specified Name tag
if [ -z "$INSTANCE_IDS" ]; then
  echo "no instances found with name: $INSTANCE_NAME"
else
  # Terminate the instances by their instance IDs
  aws ec2 terminate-instances --instance-ids $INSTANCE_IDS

  echo "terminating instances with name: $INSTANCE_NAME"
fi
