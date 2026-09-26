#!/bin/bash

# Check PDF naming convention
invalid_pdfs=$(ls *.pdf | grep -v '^Market Research -[0-9]\+\.pdf$')

if [ -n "$invalid_pdfs" ]; then
  echo "Error: The following PDF files do not match the convention 'Market Research -<number>.pdf':"
  echo "$invalid_pdfs"
  exit 1
fi

echo "All PDFs follow the correct naming convention."

# Check if instructions.md perfectly mirrors README.md
if ! cmp -s README.md instructions.md; then
  echo "Error: instructions.md does not match README.md."
  exit 1
fi

echo "instructions.md perfectly mirrors README.md."

exit 0
