#!/bin/bash

# Check PDF naming conventions
echo "Checking PDF naming conventions..."
INVALID_PDFS=$(find . -maxdepth 1 -name "*.pdf" ! -name "Market Research -*.pdf")

if [ -n "$INVALID_PDFS" ]; then
    echo "Error: The following PDF files do not follow the 'Market Research -X.pdf' naming convention:"
    echo "$INVALID_PDFS"
    exit 1
else
    echo "All PDF files follow the correct naming convention."
fi

# Check if instructions.md mirrors README.md
echo "Checking if instructions.md mirrors README.md..."
if cmp -s README.md instructions.md; then
    echo "instructions.md perfectly mirrors README.md."
else
    echo "Error: instructions.md does not perfectly mirror README.md."
    exit 1
fi

echo "All checks passed!"
exit 0
