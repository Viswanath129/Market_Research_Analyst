#!/bin/bash

# Check PDF naming convention
# Find any .pdf files that do not start with "Market Research -"
bad_pdfs=$(find . -maxdepth 1 -name "*.pdf" ! -name "Market Research -*.pdf")

if [ -n "$bad_pdfs" ]; then
  echo "Error: The following PDFs do not follow the 'Market Research -*.pdf' naming convention:"
  echo "$bad_pdfs"
  exit 1
fi

# Check instructions.md mirrors README.md
if ! cmp -s README.md instructions.md; then
  echo "Error: instructions.md does not perfectly mirror README.md"
  exit 1
fi

echo "All conventions checked successfully!"
exit 0
