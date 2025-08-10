#!/bin/bash

# Step 1: Ask for the user's name
echo "Please enter your name: "
read name

# Step 2: Create the main directory using the user's name
app_directory="submission_reminder_${name}"
mkdir -p "$app_directory"

# Step 3: Create subdirectories inside the main directory
mkdir -p "$app_directory"/{bin,src,config,data}

# Step 4: Create the files inside the subdirectories and add the given content

# Create and populate reminder.sh
cat << 'EOF' > "$app_directory/src/reminder.sh"
#!/bin/bash
# Reminder script for the application
echo "Reminder: Submit your assignments!"
EOF

# Create and populate functions.sh
cat << 'EOF' > "$app_directory/src/functions.sh"
#!/bin/bash
# Functions for the submission reminder app

function check_submission_status {
    # Check if a student has submitted their work
    echo "Checking submission status..."
}
EOF

# Create and populate config.env
cat << 'EOF' > "$app_directory/config/config.env"
# Configuration for the submission reminder app
APP_NAME="Submission Reminder App"
VERSION="1.0"
EOF

# Step 5: Create the missing startup.sh script
cat << 'EOF' > "$app_directory/startup.sh"
#!/bin/bash
# Start the submission reminder app

echo "Starting the Submission Reminder App..."

# Load the environment variables
source ./config/config.env

# Execute reminder script
bash ./src/reminder.sh
EOF

# Step 6: Make the startup.sh script executable
chmod +x "$app_directory/startup.sh"

# Step 7: Add a sample student record to submissions.txt (modify as needed)
echo "Adding sample student records to submissions.txt"
cat << 'EOF' > "$app_directory/data/submissions.txt"
# Sample student submission records
Student1, submitted
Student2, not submitted
Student3, submitted
Student4, not submitted
Student5, submitted
Student6, not submitted
EOF

# Step 8: Add an image file (image.png) to the root directory of the app
touch "$app_directory/image.png"

# Step 9: Provide a success message
echo "Environment setup completed successfully for $name!"
echo "To start the app, run './startup.sh' inside the $app_directory directory."

