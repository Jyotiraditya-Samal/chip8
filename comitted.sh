#!/bin/bash

# Check if Git is initialized
if [ ! -d ".git" ]; then
    echo "This directory is not a Git repository. Run 'git init' before executing this script."
    exit 1
fi

# Constants
START_DATE="2024-10-01"
END_DATE=$(date '+%Y-%m-%d')
DATE_FORMAT="+%Y-%m-%d"

# Function to generate a random date
generate_random_date() {
    local start=$(date -d "$START_DATE" +%s)
    local end=$(date -d "$END_DATE" +%s)
    local random_timestamp=$((RANDOM % (end - start + 1) + start))
    echo $(date -d "@$random_timestamp" $DATE_FORMAT)
}

# Generate 30 commits
for i in {1..30}; do
    # Create a random text file
    FILENAME="random_file_$i.txt"
    echo "This is a test file number $i" > $FILENAME
    echo "Created file: $FILENAME"

    # Stage the file
    git add $FILENAME

    # Generate a random date and time
    RANDOM_DATE=$(generate_random_date)

    # Commit with the random date
    git commit --date="$RANDOM_DATE" -m "test commit $i on $RANDOM_DATE"
    echo "Committed $FILENAME with date $RANDOM_DATE"
done

echo "All 30 commits have been created with random dates."
