#!/bin/bash

# Step 1: Ask for the user's name
echo "Please enter your name: "
read name

# Step 2: Create the main directory using the user's name
app_directory="submission_reminder_${name}"
mkdir -p "$app_directory"

# Step 3: Create subdirectories inside the main directory
mkdir -p "$app_directory"/{app,modules,config,assets}

# Step 4: Create the files inside the subdirectories and add the given content

# Create and populate reminder.sh
cat << 'EOF' > "$app_directory/app/reminder.sh"
#!/bin/bash
# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file

EOF

# Create and populate functions.sh
cat << 'EOF' > "$app_directory/modules/functions.sh"
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    tail -n +2 "$submissions_file" | while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace and normalize case
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted' (case-insensitive)
        if [[ "${assignment,,}" == "${ASSIGNMENT,,}" && "${status,,}" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done
}
EOF

# Create and populate config.env
cat << 'EOF' > "$app_directory/config/config.env"
# Configuration for the submission reminder app
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2

EOF

# Step 5: Create the missing startup.sh script
cat << 'EOF' > "$app_directory/startup.sh"
#!/bin/bash
# Start the submission reminder app

echo "Starting the Submission Reminder App..."

# Execute reminder script
chmod +x app/reminder.sh
bash ./app/reminder.sh
EOF

# Step 6: Make the startup.sh script executable
chmod +x "$app_directory/startup.sh"

# Step 7: Add a sample student record to submissions.txt (modify as needed)
echo "Adding sample student records to submissions.txt"
cat << 'EOF' > "$app_directory/assets/submissions.txt"
# Sample student submission records
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Andrea,shell navigation, submitted
Moikan,shell basics, not submitted
kathia,Git, submitted
Peace,shell processes, not submitted
chisom,shell signals, submittted
EOF


# Step 9: Provide a success message
echo "Environment setup completed successfully for $name!"
echo "To start the app, run './startup.sh' inside the $app_directory directory."

