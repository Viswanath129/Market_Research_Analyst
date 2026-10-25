#!/bin/bash

# Check if instructions.md mirrors README.md
diff_output=$(diff README.md instructions.md 2>&1)
if [ $? -ne 0 ]; then
  echo "Error: instructions.md does not perfectly mirror README.md"
  echo "$diff_output"
  exit 1
fi

# Check PDF naming convention
invalid_pdfs=$(find . -maxdepth 1 -name "*.pdf" ! -name "Market Research -*.pdf")

if [ -n "$invalid_pdfs" ]; then
  echo "Error: The following PDF files do not match the naming convention 'Market Research -*.pdf':"
  echo "$invalid_pdfs"
  exit 1
fi

echo "All conventions are met!"
exit 0
