#!/bin/bash

# Check PDF naming convention
echo "Checking PDF naming conventions..."

find . -maxdepth 1 -name "*.pdf" | while read -r file; do
    filename=$(basename "$file")
    if [[ ! "$filename" =~ ^Market\ Research\ -[0-9]+\.pdf$ ]]; then
        echo "Error: File '$filename' does not follow the correct naming convention ('Market Research -X.pdf')."
        exit 1
    fi
done

# Check if the while loop's subshell exited with error
if [ $? -ne 0 ]; then
    exit 1
fi

echo "PDF naming conventions passed."

# Check if instructions.md mirrors README.md
echo "Checking if instructions.md perfectly mirrors README.md..."
if ! diff -q README.md instructions.md > /dev/null; then
    echo "Error: instructions.md does not perfectly mirror README.md."
    exit 1
fi

echo "instructions.md mirrors README.md passed."

echo "All checks passed successfully."
exit 0
