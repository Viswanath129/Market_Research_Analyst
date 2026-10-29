#!/bin/bash

# Check PDF naming convention
err=0

for file in *.pdf; do
  # Check if file exists to handle case when no pdfs are present
  [ -e "$file" ] || continue
  if [[ ! "$file" =~ ^Market\ Research\ -[0-9]+\.pdf$ ]]; then
    echo "Invalid PDF naming: $file"
    err=1
  fi
done

# Check if instructions.md mirrors README.md
if [ ! -f "instructions.md" ]; then
  echo "instructions.md is missing"
  err=1
elif ! cmp -s README.md instructions.md; then
  echo "instructions.md does not match README.md"
  err=1
fi

if [ $err -eq 0 ]; then
  echo "All conventions checked and passed."
fi

exit $err
