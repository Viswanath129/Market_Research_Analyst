#!/bin/bash

# Check if instructions.md perfectly mirrors README.md
if cmp -s README.md instructions.md; then
  echo "instructions.md matches README.md"
else
  echo "ERROR: instructions.md does not match README.md"
  exit 1
fi

# Check if all PDF files follow the naming convention Market Research -X.pdf
for file in *.pdf; do
  if [[ ! "$file" =~ ^Market\ Research\ -[0-9]+\.pdf$ ]]; then
    echo "ERROR: File '$file' does not follow the correct naming convention 'Market Research -X.pdf'"
    exit 1
  fi
done

echo "All PDF files follow the correct naming convention."
exit 0
