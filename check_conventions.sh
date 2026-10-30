#!/bin/bash

# Check if instructions.md mirrors README.md
diff README.md instructions.md > /dev/null
if [ $? -eq 0 ]; then
  echo "instructions.md mirrors README.md: PASS"
else
  echo "instructions.md mirrors README.md: FAIL"
  exit 1
fi

# Check PDF naming convention (starts with "Market Research -")
FAIL=0
for f in *.pdf; do
  if [[ "$f" != Market\ Research\ -*.pdf ]]; then
    echo "File naming convention check: FAIL ($f)"
    FAIL=1
  fi
done

if [ $FAIL -eq 0 ]; then
  echo "File naming convention check: PASS"
else
  exit 1
fi

echo "All checks passed!"
exit 0
