#!/bin/bash

# Check PDF naming convention
echo "Checking PDF naming conventions..."
INVALID_PDFS=()
for file in *.pdf; do
  if [[ ! "$file" =~ ^Market\ Research\ -[0-9]+\.pdf$ ]]; then
    INVALID_PDFS+=("$file")
  fi
done

if [ ${#INVALID_PDFS[@]} -ne 0 ]; then
  echo "Error: The following PDF files do not follow the naming convention 'Market Research -X.pdf':"
  for invalid_file in "${INVALID_PDFS[@]}"; do
    echo "  - $invalid_file"
  done
  exit 1
fi

echo "PDF naming conventions passed."

# Check if instructions.md mirrors README.md
echo "Checking if instructions.md mirrors README.md..."
if ! diff -q README.md instructions.md > /dev/null; then
  echo "Error: instructions.md does not perfectly mirror README.md."
  exit 1
fi

echo "instructions.md perfectly mirrors README.md."

echo "All conventions passed."
exit 0
