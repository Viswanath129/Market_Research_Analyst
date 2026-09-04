#!/bin/bash

# Check if instructions.md mirrors README.md
if cmp -s README.md instructions.md; then
  echo "instructions.md perfectly mirrors README.md."
else
  echo "Error: instructions.md does not mirror README.md."
  exit 1
fi

# Check if all PDF files follow the naming convention (start with 'Market Research')
for file in *.pdf; do
  if [[ "$file" != "Market Research"* ]]; then
    echo "Error: File '$file' does not follow the correct naming convention."
    exit 1
  fi
done

echo "All PDF files follow the correct naming convention."
exit 0
