#!/bin/bash

set -e

echo "Running convention checks..."

# Check PDF naming convention
invalid_pdfs=$(find . -maxdepth 1 -name "*.pdf" ! -name "Market Research -*.pdf")

if [ -n "$invalid_pdfs" ]; then
    echo "Error: Found PDF files that do not follow the naming convention 'Market Research -X.pdf':"
    echo "$invalid_pdfs"
    exit 1
fi

# Check if instructions.md mirrors README.md
if ! cmp -s README.md instructions.md; then
    echo "Error: instructions.md does not mirror README.md exactly."
    exit 1
fi

echo "All checks passed successfully."
exit 0
