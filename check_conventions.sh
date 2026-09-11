#!/bin/bash

# Check if instructions.md perfectly mirrors README.md
if cmp -s README.md instructions.md; then
  echo "Success: instructions.md perfectly mirrors README.md"
else
  echo "Error: instructions.md does not perfectly mirror README.md"
  exit 1
fi

# Check PDF naming convention
invalid_pdfs=0
for pdf in *.pdf; do
  # Check if the file exists (handles the case where no pdfs exist)
  if [ -e "$pdf" ]; then
    if [[ ! "$pdf" =~ ^Market\ Research\ -[0-9]+\.pdf$ ]]; then
      echo "Error: Invalid PDF naming convention for '$pdf'"
      invalid_pdfs=1
    fi
  fi
done

if [ "$invalid_pdfs" -eq 1 ]; then
  echo "Some PDF files have invalid names. Please use the convention 'Market Research -X.pdf'"
  exit 1
else
  echo "Success: All PDF files follow the correct naming convention."
fi

echo "All checks passed successfully."
exit 0
