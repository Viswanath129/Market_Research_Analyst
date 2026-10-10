#!/bin/bash

# Check PDF naming convention
echo "Checking PDF naming convention..."
bad_pdfs=$(find . -maxdepth 1 -name "*.pdf" ! -name "Market Research*.pdf")
if [ -n "$bad_pdfs" ]; then
  echo "Error: The following PDFs do not follow the 'Market Research*.pdf' naming convention:"
  echo "$bad_pdfs"
  exit 1
fi
echo "PDF naming convention check passed."

# Check if instructions.md mirrors README.md
echo "Checking if instructions.md mirrors README.md..."
if ! cmp -s README.md instructions.md; then
  echo "Error: instructions.md does not perfectly mirror README.md"
  exit 1
fi
echo "instructions.md mirroring check passed."

echo "All checks passed successfully."
exit 0
