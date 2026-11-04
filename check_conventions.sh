#!/bin/bash

# Check if instructions.md perfectly mirrors README.md
if diff -q README.md instructions.md > /dev/null; then
  echo "✅ instructions.md mirrors README.md"
else
  echo "❌ instructions.md does not mirror README.md"
  exit 1
fi

# Check if all PDF files follow the correct naming convention
# Must start with "Market Research -" followed by a number and ".pdf"
incorrect_pdfs=0

# Use nullglob to handle case where no pdfs exist
shopt -s nullglob
for pdf in *.pdf; do
  # Skip if it matches the pattern exactly
  if [[ "$pdf" =~ ^Market\ Research\ -[0-9]+\.pdf$ ]]; then
    continue
  else
    echo "❌ Incorrect PDF naming: $pdf"
    incorrect_pdfs=$((incorrect_pdfs + 1))
  fi
done
shopt -u nullglob

if [ $incorrect_pdfs -eq 0 ]; then
  echo "✅ All PDF files follow the naming convention"
else
  echo "❌ Found $incorrect_pdfs PDF files with incorrect naming conventions."
  exit 1
fi

echo "All checks passed!"
exit 0
