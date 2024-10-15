#!/bin/bash

# Check if Git is initialized
if [ ! -d ".git" ]; then
    echo "This directory is not a Git repository. Run 'git init' before executing this script."
    exit 1
fi

# Generate 30 random dates between October 1, 2024, and today
START_DATE="2024-10-01"
END_DATE="2025-01-26"
DATE_FORMAT="+%Y-%m-%d"

# Function to generate a random date
generate_random_date() {
    local start=$(date -d "$START_DATE" +%s)
    local end=$(date -d "$END_DATE" +%s)
    local random=$((RANDOM % (end - start + 1) + start))
    echo $(date -d "@$random" $DATE_FORMAT)
}

# Generate 30 commits
for i in {60..90}; do
    # Create a random text file
    TEMP_DATE=$START_DATE
    FILENAME="random_file_$i.txt"
    echo "This is a test file number $i" > $FILENAME
    echo "Created file: $FILENAME"

    # Stage the file
    git add $FILENAME

    # Generate a random date
    RANDOM_DATE=$TEMP_DATE
    $TEMP_DATE = $((TEMP_DATE+1))

    # Commit with the random date
    git commit --date="$RANDOM_DATE" -m "test commit $i on $RANDOM_DATE"
    echo "Committed $FILENAME with date $RANDOM_DATE"
done

echo "All 30 commits have been created with random dates."


