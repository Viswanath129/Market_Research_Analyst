#!/bin/bash

# Check if all PDF files follow the correct naming convention
echo "Checking PDF naming conventions..."
invalid_pdfs=$(find . -maxdepth 1 -type f -name "*.pdf" ! -name "Market Research -*.pdf")

if [ -n "$invalid_pdfs" ]; then
  echo "Error: The following PDF files do not follow the naming convention 'Market Research -*.pdf':"
  echo "$invalid_pdfs"
  exit 1
fi

echo "All PDF files follow the correct naming convention."

# Check if instructions.md perfectly mirrors README.md
echo "Checking if instructions.md perfectly mirrors README.md..."

if ! cmp -s README.md instructions.md; then
  echo "Error: instructions.md does not perfectly mirror README.md."
  exit 1
fi

echo "instructions.md perfectly mirrors README.md."

echo "All conventions are followed!"
exit 0
