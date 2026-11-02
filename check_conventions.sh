#!/bin/bash

# Check PDF naming convention
echo "Checking PDF naming convention..."
invalid_pdfs=$(find . -maxdepth 1 -type f -name "*.pdf" ! -name "Market Research*.pdf")
if [ -n "$invalid_pdfs" ]; then
  echo "Error: The following PDF files do not follow the naming convention (capitalizing 'Market Research'):"
  echo "$invalid_pdfs"
  exit 1
fi
echo "PDF naming convention: OK"

# Check if instructions.md mirrors README.md
echo "Checking if instructions.md mirrors README.md..."
if ! cmp -s README.md instructions.md; then
  echo "Error: instructions.md does not match README.md perfectly."
  exit 1
fi
echo "instructions.md mirror: OK"

echo "All conventions check passed!"
exit 0
