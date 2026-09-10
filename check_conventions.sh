#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

echo "Running checks..."

# Check PDF naming convention
echo "Checking PDF naming conventions..."
bad_pdfs=$(find . -maxdepth 1 -name "*.pdf" ! -name "Market Research -*.pdf")

if [ -n "$bad_pdfs" ]; then
    echo "Error: The following PDFs do not follow the 'Market Research -*.pdf' naming convention:"
    echo "$bad_pdfs"
    exit 1
else
    echo "All PDF files follow the correct naming convention."
fi

# Check if instructions.md mirrors README.md
echo "Checking if instructions.md mirrors README.md..."
if ! cmp -s README.md instructions.md; then
    echo "Error: instructions.md does not perfectly mirror README.md"
    exit 1
else
    echo "instructions.md perfectly mirrors README.md."
fi

echo "All checks passed successfully."
