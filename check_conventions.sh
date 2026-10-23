#!/bin/bash

# Check if instructions.md perfectly mirrors README.md
if cmp -s README.md instructions.md; then
  echo "instructions.md perfectly mirrors README.md"
else
  echo "Error: instructions.md does not perfectly mirror README.md"
  exit 1
fi

# Check PDF naming convention
FAILED_PDF_CHECK=0
for file in *.pdf; do
  if [[ "$file" != "Market Research -"[0-9]*.pdf ]]; then
    echo "Error: File '$file' does not follow the naming convention 'Market Research -<number>.pdf'"
    FAILED_PDF_CHECK=1
  fi
done

if [ $FAILED_PDF_CHECK -eq 1 ]; then
  echo "PDF naming convention check failed."
  exit 1
else
  echo "All PDF files follow the correct naming convention."
fi

echo "All checks passed successfully."
exit 0
