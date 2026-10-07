#!/bin/bash

# 1. Check if all PDF files start with "Market Research "
FAILED=0

for pdf in *.pdf; do
    if [[ ! "$pdf" =~ ^Market\ Research\ -[0-9]+\.pdf$ ]]; then
        echo "Error: PDF file '$pdf' does not follow the correct naming convention."
        FAILED=1
    fi
done

if [ $FAILED -eq 1 ]; then
    echo "PDF naming convention check failed."
    exit 1
fi

# 2. Check if instructions.md perfectly mirrors README.md
if ! cmp -s README.md instructions.md; then
    echo "Error: instructions.md does not perfectly mirror README.md"
    exit 1
fi

echo "All checks passed successfully."
exit 0
