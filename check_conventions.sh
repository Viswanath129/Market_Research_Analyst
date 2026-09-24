#!/bin/bash

# Check if instructions.md mirrors README.md
if cmp -s README.md instructions.md; then
  echo "instructions.md matches README.md"
else
  echo "Error: instructions.md does not perfectly mirror README.md"
  exit 1
fi

# Check PDF naming conventions
shopt -s nullglob
pdfs=(*.pdf)

for pdf in "${pdfs[@]}"; do
  if [[ ! "$pdf" =~ ^Market\ Research\ -[0-9]+\.pdf$ ]]; then
    echo "Error: PDF file '$pdf' does not follow the naming convention 'Market Research -X.pdf'"
    exit 1
  fi
done

echo "All PDF files follow the naming convention."
echo "Validation passed."
exit 0
