#!/bin/bash

# Check if any hosts were passed as arguments
if [ $# -eq 0 ]; then
  echo "Usage: $0 host1 [host2] [host3] ..."
  echo "Resets iptables on the given hosts."
  exit 1
fi

# Get the list of hosts from the command line arguments
HOSTS=("$@")

# Define the command to reset iptables and set the policy to ACCEPT
IPTABLES_RESET_CMD='sudo iptables -P INPUT ACCEPT && sudo iptables -P FORWARD ACCEPT && sudo iptables -P OUTPUT ACCEPT && sudo iptables -F'

# Loop through each host and prompt for confirmation before resetting iptables
for HOST in "${HOSTS[@]}"
do
  echo "Resetting iptables on ${HOST}..."
  read -p "Are you sure you want to reset iptables on ${HOST}? [y/n]: " CONFIRM_RESET
  if [[ "$CONFIRM_RESET" == "y" ]]; then
    ssh "${HOST}" "${IPTABLES_RESET_CMD}"
    echo "Iptables reset on ${HOST} completed successfully."
  else
    echo "Skipping ${HOST}."
  fi
done

echo "Done!"
