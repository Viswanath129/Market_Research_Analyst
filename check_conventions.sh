#!/bin/bash

# Check PDF naming convention
invalid_pdfs=$(find . -maxdepth 1 -name "*.pdf" | sed 's|^\./||' | grep -vE "^Market Research -[0-9]+\.pdf$")

if [ -n "$invalid_pdfs" ]; then
    echo "Error: The following PDFs do not follow the naming convention 'Market Research -X.pdf':"
    echo "$invalid_pdfs"
    exit 1
fi

# Check if instructions.md mirrors README.md
if ! cmp -s README.md instructions.md; then
    echo "Error: instructions.md does not perfectly mirror README.md"
    exit 1
fi

echo "All conventions checked successfully!"
exit 0
