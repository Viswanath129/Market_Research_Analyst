#!/bin/bash

# Check if instructions.md perfectly mirrors README.md
if diff README.md instructions.md > /dev/null; then
  echo "instructions.md mirrors README.md: PASS"
else
  echo "instructions.md does NOT mirror README.md: FAIL"
  exit 1
fi

# Check if all PDF files follow the correct naming convention
# "Market Research -X.pdf"
# Specifically check that they don't start with "market Research"
FAIL=0
for f in *.pdf; do
  if [[ "$f" =~ ^market\ Research ]]; then
    echo "Naming convention error: $f (should be capitalized 'Market Research')"
    FAIL=1
  fi
done

if [ $FAIL -eq 0 ]; then
  echo "PDF naming conventions: PASS"
else
  exit 1
fi

exit 0
