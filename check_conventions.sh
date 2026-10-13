#!/bin/bash

# Check if instructions.md mirrors README.md
if ! cmp -s README.md instructions.md; then
  echo "Error: instructions.md does not perfectly mirror README.md"
  exit 1
fi

# Check PDF naming conventions
error=0
for file in *.pdf; do
  if [ -e "$file" ]; then
    # Capital 'M', 'R', followed by ' -', alphanumeric, and '.pdf'
    if [[ ! "$file" =~ ^Market\ Research\ -[A-Za-z0-9]+\.pdf$ ]]; then
      echo "Error: PDF file '$file' does not follow the correct naming convention."
      error=1
    fi
  fi
done

if [ "$error" -eq 1 ]; then
  exit 1
fi

echo "All conventions checked successfully."
exit 0
