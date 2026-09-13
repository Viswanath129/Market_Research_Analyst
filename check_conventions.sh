#!/bin/bash

# Check if instructions.md exactly matches README.md
if ! cmp -s README.md instructions.md; then
  echo "Error: instructions.md does not exactly match README.md"
  exit 1
fi
echo "instructions.md perfectly mirrors README.md"

# Check if any pdf file does not start with 'Market Research -'
# Using find to get all pdf files and grep to filter those that DO NOT match
invalid_pdfs=$(find . -maxdepth 1 -name "*.pdf" -type f | sed 's|^\./||' | grep -v "^Market Research -[0-9]\+\.pdf$")

if [ -n "$invalid_pdfs" ]; then
  echo "Error: The following PDF files do not match the correct naming convention ('Market Research -X.pdf'):"
  echo "$invalid_pdfs"
  exit 1
fi

echo "All PDF files follow the correct naming convention."
exit 0
