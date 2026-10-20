#!/bin/bash

# Check if instructions.md mirrors README.md
if cmp -s README.md instructions.md; then
  echo "✅ instructions.md perfectly mirrors README.md"
else
  echo "❌ Error: instructions.md does not mirror README.md"
  exit 1
fi

# Check PDF naming convention
invalid_pdfs=$(find . -maxdepth 1 -name "*.pdf" | grep -vE "^\./Market Research -[0-9]+\.pdf$")

if [ -z "$invalid_pdfs" ]; then
  echo "✅ All PDF files follow the correct naming convention ('Market Research -X.pdf')"
else
  echo "❌ Error: The following PDF files do not follow the naming convention:"
  echo "$invalid_pdfs"
  exit 1
fi

echo "All checks passed!"
exit 0
