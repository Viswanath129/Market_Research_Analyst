#!/bin/bash

FAIL=0

# Check PDF naming convention
for file in *.pdf; do
  if [[ "$file" != "Market Research -"*".pdf" ]]; then
    echo "Error: PDF file '$file' does not follow naming convention."
    FAIL=1
  fi
done

# Check if instructions.md mirrors README.md
if ! cmp -s README.md instructions.md; then
  echo "Error: instructions.md does not match README.md"
  FAIL=1
fi

if [ $FAIL -eq 1 ]; then
  exit 1
fi

echo "All checks passed."
exit 0
