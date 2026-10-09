#!/bin/bash

# Check PDF naming conventions
for file in *.pdf; do
    if [[ ! "$file" == Market\ Research*.pdf ]]; then
        echo "Error: PDF file naming convention violated by '$file'."
        echo "Expected files to start with 'Market Research'."
        exit 1
    fi
done

# Check if instructions.md mirrors README.md
if ! cmp -s README.md instructions.md; then
    echo "Error: instructions.md does not perfectly mirror README.md"
    exit 1
fi

echo "All checks passed."
exit 0
