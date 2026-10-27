#!/bin/bash

# Check if any PDF files start with lowercase 'm' instead of 'M'
invalid_pdfs=$(find . -maxdepth 1 -name "market Research *.pdf")
if [ -n "$invalid_pdfs" ]; then
    echo "Error: Found PDF files not following the naming convention (capitalized 'M'):"
    echo "$invalid_pdfs"
    exit 1
fi

# Check if instructions.md mirrors README.md
if ! cmp -s README.md instructions.md; then
    echo "Error: instructions.md does not exactly mirror README.md"
    exit 1
fi

echo "All conventions met!"
exit 0
