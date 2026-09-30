#!/bin/bash
shopt -s nullglob

# Check PDF naming convention
for file in *.pdf; do
    if [[ ! "$file" =~ ^Market\ Research\ -[0-9]+\.pdf$ ]]; then
        echo "Invalid PDF naming convention: $file"
        exit 1
    fi
done

# Check if instructions.md perfectly mirrors README.md
if ! cmp -s README.md instructions.md; then
    echo "instructions.md does not mirror README.md"
    exit 1
fi

echo "All checks passed!"
exit 0