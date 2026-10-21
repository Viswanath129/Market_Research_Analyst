#!/bin/bash

# Check PDF file names
echo "Checking PDF file naming convention..."
invalid_pdfs=$(ls -1 *.pdf 2>/dev/null | grep -v '^Market Research -')

if [ -n "$invalid_pdfs" ]; then
    echo "Error: The following PDF files do not follow the 'Market Research -*.pdf' naming convention:"
    echo "$invalid_pdfs"
    exit 1
fi

echo "PDF file names are correct."

# Check instructions.md mirrors README.md
echo "Checking if instructions.md mirrors README.md..."
if ! cmp -s README.md instructions.md; then
    echo "Error: instructions.md does not exactly mirror README.md."
    exit 1
fi

echo "instructions.md exactly mirrors README.md."

echo "All conventions are met!"
exit 0
