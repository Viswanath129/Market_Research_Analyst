#!/bin/bash

# Check if instructions.md mirrors README.md
diff README.md instructions.md > /dev/null
if [ $? -eq 0 ]; then
  echo "instructions.md perfectly mirrors README.md."
else
  echo "ERROR: instructions.md does not mirror README.md."
  exit 1
fi

# Check PDF naming convention
invalid_pdfs=0
for pdf in *.pdf; do
  if [[ ! "$pdf" =~ ^Market\ Research\ \-[0-9]+\.pdf$ ]]; then
    echo "ERROR: Invalid PDF naming convention for file: $pdf"
    invalid_pdfs=$((invalid_pdfs + 1))
  fi
done

if [ $invalid_pdfs -eq 0 ]; then
  echo "All PDF files follow the correct naming convention."
else
  echo "ERROR: Found $invalid_pdfs PDF(s) with invalid naming conventions."
  exit 1
fi

echo "All checks passed!"
exit 0