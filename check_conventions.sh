#!/bin/bash
set -e

# Check PDF naming convention
for file in *.pdf; do
    if [[ "$file" =~ ^market\ Research.*\.pdf$ ]]; then
        echo "Error: File $file does not follow naming convention"
        exit 1
    fi
done

# Check if instructions.md perfectly mirrors README.md
if ! cmp -s README.md instructions.md; then
    echo "Error: instructions.md does not perfectly mirror README.md"
    exit 1
fi

echo "All checks passed"