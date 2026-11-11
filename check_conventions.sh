#!/bin/bash

# Check if instructions.md mirrors README.md
cmp -s README.md instructions.md
if [ $? -ne 0 ]; then
  echo "Error: instructions.md does not mirror README.md"
  exit 1
fi

# Check PDF naming convention
for file in *.pdf; do
  if [[ "$file" =~ ^Market\ Research\ -[0-9]+\.pdf$ ]]; then
    continue
  else
    echo "Error: File $file does not follow naming convention"
    exit 1
  fi
done

echo "All checks passed successfully."
