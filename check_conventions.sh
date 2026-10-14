#!/bin/bash

# Check PDF naming convention
invalid_pdfs=$(find . -maxdepth 1 -name "*.pdf" ! -name "Market Research -*.pdf")
if [ -n "$invalid_pdfs" ]; then
  echo "Error: The following PDF files do not follow the 'Market Research -X.pdf' naming convention:"
  echo "$invalid_pdfs"
  exit 1
fi

# Check if instructions.md perfectly mirrors README.md
if ! cmp -s README.md instructions.md; then
  echo "Error: instructions.md does not perfectly mirror README.md"
  exit 1
fi

echo "All checks passed!"
exit 0
