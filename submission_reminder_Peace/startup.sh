#!/bin/bash
# Start the submission reminder app

echo "Starting the Submission Reminder App..."

# Load the environment variables
source ./config/config.env

# Execute reminder script
bash ./src/reminder.sh
