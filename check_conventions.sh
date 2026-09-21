#!/bin/bash

# Check if instructions.md perfectly mirrors README.md
if ! cmp -s README.md instructions.md; then
  echo "Error: instructions.md does not perfectly mirror README.md"
  exit 1
fi

# Check if any PDF file name starts with a lowercase 'market'
lowercase_pdf_count=$(ls *.pdf 2>/dev/null | grep -E '^market.*\.pdf$' | wc -l)

if [ "$lowercase_pdf_count" -gt 0 ]; then
  echo "Error: Found PDF files not following naming convention (starts with lowercase 'market')"
  exit 1
fi

echo "All conventions checked and passed successfully!"
exit 0
