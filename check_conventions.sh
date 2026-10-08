#!/bin/bash

# Check PDF naming convention
echo "Checking PDF naming convention..."
invalid_pdfs=$(find . -maxdepth 1 -name "*.pdf" | grep -vE '^\./Market Research -[0-9]+\.pdf$')

if [ -n "$invalid_pdfs" ]; then
  echo "ERROR: The following PDF files do not follow the 'Market Research -X.pdf' convention:"
  echo "$invalid_pdfs"
  exit 1
else
  echo "All PDFs follow the naming convention."
fi

# Check if instructions.md mirrors README.md
echo "Checking if instructions.md mirrors README.md..."
if cmp -s README.md instructions.md; then
  echo "instructions.md perfectly mirrors README.md."
else
  echo "ERROR: instructions.md does not match README.md."
  exit 1
fi

echo "All checks passed successfully."
exit 0
