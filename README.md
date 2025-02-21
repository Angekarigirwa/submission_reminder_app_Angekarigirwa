Submission Reminder Application
Overview

This is a simple shell-based application that reminds of overdue submission of assignments.

Directory Structure

The application produces the following directory structure:

submission_reminder_Karigirwa/
├── app/
│   └── reminder.sh
├── config/
│   └── config.env
├── modules/
│   └── functions.sh
├── assets/
│   └── submissions.txt
├── startup.sh

Prerequisites

Ensure you have the following installed on your machine:

Bash

Unix/Linux environment (or WSL on Windows)

Setup Instructions

Clone or initialize the project directory:
git clone <repository_url>
cd submission_reminder_Karigirwa

Run the setup script to create the needed directories and files:

./startup.sh

Configuration

The config.env file contains the configuration variables:

ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2

Modify this file to change the assignment name or due date.

Usage

To check for pending submissions and send reminders, run:

./app/reminder.sh

This will:

Read the submissions.txt file

Identify students with pending submissions

Print reminders for each pending submission

File Descriptions

submissions.txt: Stores student submission status.

functions.sh: Stores the function to check for pending submissions.

reminder.sh: Master script to run the check and show reminders.

startup.sh: Initializes and starts the app.

Example Output

Assignment: Shell Navigation
Days remaining to submit: 2 days
--------------------------------------------
Reminder: Ange has not submitted the Shell Navigation assignment!
Reminder: herve has not submitted the Shell Navigation assignment!
Reminder: chrispin has not submitted the Shell Navigation assignment!
Reminder: yvonne has not submitted the Shell Navigation assignment!

Notes

Ensure all scripts are executable:
chmod +x app/reminder.sh modules/functions.sh startup.sh

The script will only verify assignments that match the specified ASSIGNMENT in config.env.

Author
Karigirwa
