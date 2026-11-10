#!/bin/bash

# Check PDF naming convention
for file in *.pdf; do
    if [[ ! "$file" =~ ^Market\ Research\ -[0-9]+\.pdf$ ]]; then
        echo "Error: PDF file '$file' does not follow the naming convention 'Market Research -<number>.pdf'"
        exit 1
    fi
done
echo "All PDF files follow the naming convention."

# Check if instructions.md mirrors README.md
if ! cmp -s README.md instructions.md; then
    echo "Error: instructions.md does not perfectly mirror README.md"
    exit 1
fi
echo "instructions.md perfectly mirrors README.md."

exit 0
