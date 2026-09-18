#!/bin/bash

# Check PDF naming convention
echo "Checking PDF naming conventions..."
all_pdfs_valid=true
for file in *.pdf; do
    if [[ ! "$file" =~ ^Market\ Research\ -[0-9]+\.pdf$ ]]; then
        echo "Error: File '$file' does not follow the naming convention 'Market Research -X.pdf'."
        all_pdfs_valid=false
    fi
done

if [ "$all_pdfs_valid" = true ]; then
    echo "All PDF files follow the correct naming convention."
else
    echo "Some PDF files have invalid names."
    exit 1
fi

# Check if instructions.md mirrors README.md
echo "Checking if instructions.md mirrors README.md..."
if cmp -s README.md instructions.md; then
    echo "instructions.md perfectly mirrors README.md."
else
    echo "Error: instructions.md does not mirror README.md."
    exit 1
fi

echo "All checks passed successfully."
exit 0
