#!/bin/bash

error=0

# Check PDF naming conventions
for file in *.pdf; do
    if [[ -f "$file" ]] && [[ ! "$file" =~ ^Market\ Research\ -[0-9]+\.pdf$ ]]; then
        echo "Error: PDF file '$file' does not follow the correct naming convention."
        error=1
    fi
done

# Check if instructions.md perfectly mirrors README.md
if [[ ! -f "instructions.md" ]]; then
    echo "Error: instructions.md does not exist."
    error=1
elif ! cmp -s README.md instructions.md; then
    echo "Error: instructions.md does not perfectly mirror README.md."
    error=1
fi

if [ $error -eq 0 ]; then
    echo "All checks passed."
    exit 0
else
    echo "Checks failed."
    exit 1
fi
