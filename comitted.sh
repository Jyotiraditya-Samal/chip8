#!/bin/bash

# Check if Git is initialized
if [ ! -d ".git" ]; then
    echo "This directory is not a Git repository. Run 'git init' before executing this script."
    exit 1
fi

# Set the start date
START_DATE="2024-10-01"

# Loop for 30 days
for i in {1..30}; do
    # Calculate the commit date by adding days to the start date
    COMMIT_DATE=$(date -d "$START_DATE +$((i - 1)) days" "+%Y-%m-%d")

    # Create a random text file
    FILENAME="test_file_$i.txt"
    echo "This is test file $i for date $COMMIT_DATE" > $FILENAME
    echo "Created file: $FILENAME"

    # Stage the file
    git add $FILENAME

    # Commit the file with the specific date
    GIT_AUTHOR_DATE="$COMMIT_DATE" GIT_COMMITTER_DATE="$COMMIT_DATE" git commit -m "Test commit $i on $COMMIT_DATE"
    echo "Committed $FILENAME with date $COMMIT_DATE"
done

echo "All 30 commits have been created with consecutive dates starting from $START_DATE."
