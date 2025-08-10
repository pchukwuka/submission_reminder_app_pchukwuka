# Submission Reminder App

## Introduction

The Submission Reminder App is a software created with Linux shell scripts. It helps students keep track of assignment deadlines and sends reminders. 
The app includes set up scripts that automatically creates the required folders and files for smooth operation.
---

## Getting Started

You can obtain the project in two ways:

### 1. Fork the Repository

* Click the *Fork* button on the top right of this repository’s GitHub page.
* Clone your forked repository to your local machine:


### 2. Clone Directly

If you do not need a fork, you can clone directly from the source repository:

bash
git clone https://github.com/pchukwuka/submission_reminder_app_pchukwuka.git


Or download the ZIP file and extract it to your preferred location.

---

## Setup Instructions

1. Navigate to the directory where the project files are located.
2. Run the setup script:

   bash
   bash create_environment.sh
   
3. When prompted, enter your name.
   The script will create a new folder named:

   
   submission_reminder_{YourName}
   
4. Inside this folder, the following directories will be created automatically:

   
   app/
   modules/
   assets/
   config/
   

---

## Running the Application

1. Navigate into your newly created folder:

   bash
   cd submission_reminder_{YourName}
   
2. Run the startup script:

   bash
   ./startup.sh
   
3. The application will begin providing assignment reminders.

---

## Additional Information

* The setup script automatically sets the startup.sh file as executable; no manual permission changes are required.
* You may add more students to the submissions list at any time.
* The application requires a shell environment with Bash support.

---

## Project Structure


submission_reminder_{YourName}/
├── app/
│   └── reminder.sh
├── modules/
│   └── functions.sh
├── assets/
│   └── submissions.txt
├── config/
│   └── config.env
└── startup.sh



---

## Author


Peace Chukwuka

'
