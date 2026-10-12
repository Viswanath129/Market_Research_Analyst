#!/bin/bash

# Check PDF naming convention
echo "Checking PDF naming convention..."
# We want to find any PDF files that do NOT match "Market Research -*.pdf"
bad_pdfs=$(find . -maxdepth 1 -name "*.pdf" ! -name "Market Research -*.pdf")

if [ -n "$bad_pdfs" ]; then
  echo "Error: The following PDF files do not follow the naming convention 'Market Research -*.pdf':"
  echo "$bad_pdfs"
  exit 1
fi

echo "PDF naming convention is correct."

# Check if instructions.md perfectly mirrors README.md
echo "Checking if instructions.md perfectly mirrors README.md..."
if cmp -s README.md instructions.md; then
  echo "instructions.md perfectly mirrors README.md."
else
  echo "Error: instructions.md does not perfectly mirror README.md."
  exit 1
fi

echo "All conventions are followed."
exit 0
