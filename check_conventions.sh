#!/bin/bash

# Check PDF naming convention
invalid_pdfs=$(find . -maxdepth 1 -name "*.pdf" -not -name "Market Research -*.pdf")
if [ -n "$invalid_pdfs" ]; then
    echo "Error: The following PDFs do not follow the naming convention:"
    echo "$invalid_pdfs"
    exit 1
fi

# Check if instructions.md mirrors README.md
if ! cmp -s README.md instructions.md; then
    echo "Error: instructions.md does not mirror README.md"
    exit 1
fi

echo "All conventions passed."