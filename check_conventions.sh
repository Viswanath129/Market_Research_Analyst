#!/bin/bash

failed=0

echo "Checking PDF naming conventions..."
for file in *.pdf; do
    # Skip if no pdf files
    if [ ! -f "$file" ]; then
        continue
    fi
    # Check if the file follows the 'Market Research -X.pdf' format
    if ! [[ "$file" =~ ^Market\ Research\ -[0-9]+\.pdf$ ]]; then
        echo "Error: File '$file' does not follow the naming convention 'Market Research -X.pdf'."
        failed=1
    fi
done

echo "Checking if instructions.md perfectly mirrors README.md..."
if ! cmp -s README.md instructions.md; then
    echo "Error: instructions.md does not perfectly mirror README.md."
    failed=1
fi

if [ $failed -eq 1 ]; then
    echo "Checks failed!"
    exit 1
else
    echo "All checks passed!"
    exit 0
fi
