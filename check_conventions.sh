#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Check if instructions.md perfectly mirrors README.md
if ! cmp -s README.md instructions.md; then
  echo "Error: instructions.md does not perfectly mirror README.md"
  exit 1
fi
echo "Pass: instructions.md perfectly mirrors README.md"

# Verify all PDF files in the root match the naming convention "Market Research -*.pdf"
# Find all pdfs in the root dir
mapfile -d $'\0' pdf_files < <(find . -maxdepth 1 -name "*.pdf" -print0)

# Check if any PDFs have the wrong naming convention
wrong_pdfs=0
for pdf in "${pdf_files[@]}"; do
  # Extract the filename without the path
  filename=$(basename "$pdf")

  if [[ ! "$filename" =~ ^Market\ Research\ -[a-zA-Z0-9_]+\.pdf$ ]]; then
    # if it doesn't match the strict regex above, try a simpler glob match just to be safe
    # It seems the memory requires starting with capitalized "Market Research -"
    if [[ "$filename" == Market\ Research\ -*.pdf ]]; then
      continue
    else
      echo "Error: PDF file does not follow the naming convention: $filename"
      wrong_pdfs=1
    fi
  fi
done

if [ "$wrong_pdfs" -eq 1 ]; then
  exit 1
fi

echo "Pass: All PDF files follow the correct naming convention."
exit 0
