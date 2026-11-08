#!/bin/bash

# Check PDF naming conventions
# All PDF files should follow the convention 'Market Research -X.pdf'
shopt -s nullglob
files=(*.pdf)

exit_code=0

for file in "${files[@]}"; do
    if [[ ! "$file" =~ ^Market\ Research\ -[0-9]+\.pdf$ ]]; then
        echo "Error: PDF file '$file' does not match naming convention 'Market Research -X.pdf'."
        exit_code=1
    fi
done

if [ $exit_code -eq 0 ]; then
    echo "All PDF files match naming convention."
fi

# Check if instructions.md perfectly mirrors README.md
if diff README.md instructions.md > /dev/null; then
    echo "instructions.md perfectly mirrors README.md."
else
    echo "Error: instructions.md does not mirror README.md."
    exit_code=1
fi

exit $exit_code
