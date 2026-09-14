#!/bin/bash

# Check if instructions.md mirrors README.md
if cmp -s README.md instructions.md; then
  echo "✅ instructions.md perfectly mirrors README.md"
else
  echo "❌ instructions.md does not mirror README.md"
  exit 1
fi

# Check PDF files naming convention
bad_files=$(ls -1 *.pdf 2>/dev/null | grep -v '^Market Research -[0-9]\+\.pdf$')

if [ -z "$bad_files" ]; then
  echo "✅ All PDF files follow the correct naming convention."
else
  echo "❌ Some PDF files do not follow the correct naming convention:"
  echo "$bad_files"
  exit 1
fi

exit 0