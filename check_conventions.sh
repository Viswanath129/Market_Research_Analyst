#!/bin/bash

# Check if instructions.md perfectly mirrors README.md
if cmp -s README.md instructions.md; then
  echo "instructions.md perfectly mirrors README.md: OK"
else
  echo "Error: instructions.md does not perfectly mirror README.md"
  exit 1
fi

# Check PDF naming convention (capitalize 'Market Research')
# The pattern should be exactly "Market Research -<number>.pdf"
# We check if there are any PDFs that DO NOT match this pattern (e.g. start with "market")
bad_pdfs=$(find . -maxdepth 1 -name "*.pdf" | grep -v "\./Market Research -[0-9]*\.pdf$")

if [ -z "$bad_pdfs" ]; then
  echo "PDF naming convention: OK"
else
  echo "Error: Found PDF files not following convention 'Market Research -<number>.pdf':"
  echo "$bad_pdfs"
  exit 1
fi

echo "All checks passed!"
exit 0