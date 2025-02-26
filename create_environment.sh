#!/bin/bash
# create the main directory
mkdir -p submission_reminder_Karigirwa/{app,config,modules,assets}

touch submission_reminder_Karigirwa/config/config.env
touch submission_reminder_Karigirwa/app/reminder.sh && chmod u+x submission_reminder_Karigirwa/app/reminder.sh
touch submission_reminder_Karigirwa/modules/functions.sh && chmod u+x submission_reminder_Karigirwa/modules/functions.sh
touch submission_reminder_Karigirwa/startup.sh && chmod u+x submission_reminder_Karigirwa/startup.sh
touch submission_reminder_Karigirwa/assets/submissions.txt
echo 'student, assignment, submission status
gatego, Shell Navigation, submitted
Ange, Shell Navigation, not submitted
herve, Shell Navigation, not submitted
chrispin, Shell Navigation, not submitted
Aaliyah, Shell Navigation, submitted
yvonne, Shell Navigation, not submitted
igabe, Shell Navigation, submitted' > submission_reminder_Karigirwa/assets/submissions.txt
echo '# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2' > submission_reminder_Karigirwa/config/config.env
echo '#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

# Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}' > submission_reminder_Karigirwa/modules/functions.sh
echo '#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"
# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file' > submission_reminder_Karigirwa/app/reminder.sh
echo '#!/bin/bash
./submission_reminder_Karigirwa/app/reminder.sh' > submission_reminder_Karigirwa/startup.sh

./submission_reminder_Karigirwa/startup.sh
