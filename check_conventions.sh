#!/bin/bash

# Check if instructions.md perfectly mirrors README.md
if cmp -s README.md instructions.md; then
    echo "Check passed: instructions.md perfectly mirrors README.md"
else
    echo "Check failed: instructions.md does not mirror README.md"
    exit 1
fi

# Check PDF naming convention
invalid_pdfs=$(find . -maxdepth 1 -type f -iname "*.pdf" ! -name "Market Research -*.pdf")

if [ -z "$invalid_pdfs" ]; then
    echo "Check passed: All PDF files follow the correct naming convention ('Market Research -X.pdf')"
else
    echo "Check failed: The following PDF files do not follow the correct naming convention:"
    echo "$invalid_pdfs"
    exit 1
fi

echo "All checks passed successfully."
exit 0
