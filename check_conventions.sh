#!/bin/bash

# Exit with non-zero status if any check fails
EXIT_CODE=0

# Check PDF naming convention
echo "Checking PDF naming convention..."
invalid_pdfs=0
for f in *.pdf; do
  if [[ "$f" != Market\ Research\ -*.pdf ]]; then
    echo "Invalid PDF name: $f"
    invalid_pdfs=$((invalid_pdfs+1))
  fi
done

if [ $invalid_pdfs -eq 0 ]; then
  echo "All PDFs follow the naming convention."
else
  echo "Error: Found $invalid_pdfs PDF(s) with invalid naming convention."
  EXIT_CODE=1
fi

# Check if instructions.md mirrors README.md
echo "Checking if instructions.md perfectly mirrors README.md..."
if [ ! -f "instructions.md" ]; then
  echo "Error: instructions.md does not exist."
  EXIT_CODE=1
elif [ ! -f "README.md" ]; then
  echo "Error: README.md does not exist."
  EXIT_CODE=1
else
  diff_output=$(diff instructions.md README.md)
  if [ -z "$diff_output" ]; then
    echo "instructions.md perfectly mirrors README.md."
  else
    echo "Error: instructions.md does not mirror README.md."
    echo "Diff output:"
    echo "$diff_output"
    EXIT_CODE=1
  fi
fi

if [ $EXIT_CODE -ne 0 ]; then
  # Use exit equivalent for script file
  exit $EXIT_CODE
fi
