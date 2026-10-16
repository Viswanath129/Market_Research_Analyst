#!/bin/bash

# Check PDF naming convention
for file in *.pdf; do
    if [[ "$file" != "Market Research -"[0-9]*.pdf && "$file" != "Market Research -"[0-9][0-9]*.pdf ]]; then
        echo "Error: PDF file $file does not follow naming convention."
        exit 1
    fi
done

# Check if instructions.md mirrors README.md
if ! cmp -s README.md instructions.md; then
    echo "Error: instructions.md does not mirror README.md."
    exit 1
fi

echo "All checks passed."
exit 0
