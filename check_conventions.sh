#!/bin/bash

# Check if instructions.md perfectly mirrors README.md
if diff README.md instructions.md > /dev/null; then
  echo "SUCCESS: instructions.md perfectly mirrors README.md"
else
  echo "FAILURE: instructions.md does not mirror README.md"
  exit 1
fi

# Check if all PDF files follow the correct naming convention
failed=0
for pdf in *.pdf; do
  if [[ ! "$pdf" =~ ^Market\ Research\ -[0-9]+\.pdf$ ]]; then
    echo "FAILURE: $pdf does not follow the correct naming convention (Market Research -X.pdf)"
    failed=1
  fi
done

if [ "$failed" -eq 1 ]; then
  exit 1
else
  echo "SUCCESS: All PDF files follow the correct naming convention"
fi

exit 0
