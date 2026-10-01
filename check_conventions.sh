#!/bin/bash

# Exit on error
set -e

# Check if instructions.md perfectly mirrors README.md
if ! cmp -s README.md instructions.md; then
  echo "Error: instructions.md does not perfectly mirror README.md."
  exit 1
fi

echo "Success: instructions.md perfectly mirrors README.md."

# Check PDF naming convention
# Find all PDF files that do NOT start with "Market Research -"
incorrect_pdfs=$(find . -maxdepth 1 -name "*.pdf" ! -name "Market Research -*.pdf")

if [ -n "$incorrect_pdfs" ]; then
  echo "Error: The following PDF files do not follow the naming convention 'Market Research -*.pdf':"
  echo "$incorrect_pdfs"
  exit 1
fi

echo "Success: All PDF files follow the naming convention."

echo "All conventions checked successfully!"
exit 0
