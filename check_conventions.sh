#!/bin/bash

# Check if instructions.md exactly mirrors README.md
if ! diff -q README.md instructions.md > /dev/null 2>&1; then
  echo "Error: instructions.md does not perfectly mirror README.md"
  exit 1
fi

# Check for improperly named PDF files
# Look for any PDF file that matches 'market Research' case-insensitively
# but doesn't exactly start with 'Market Research -'
# Let's verify all PDF files follow the pattern "Market Research -[0-9]*.pdf"

# Find any pdf file in the current directory
all_pdfs=$(find . -maxdepth 1 -name "*.pdf" | sed 's/^\.\///')

errors=0
while IFS= read -r file; do
  if [[ -n "$file" ]]; then
    # Check if the file exactly matches the expected pattern
    if [[ ! "$file" =~ ^Market\ Research\ -[0-9]+\.pdf$ ]]; then
      echo "Error: PDF file does not follow naming convention 'Market Research -X.pdf': $file"
      errors=$((errors + 1))
    fi
  fi
done <<< "$all_pdfs"

if [ "$errors" -gt 0 ]; then
  exit 1
fi

echo "All conventions checked successfully."
exit 0
