#!/bin/bash

# Check if instructions.md mirrors README.md exactly
if cmp -s README.md instructions.md; then
  echo "instructions.md perfectly mirrors README.md"
else
  echo "Error: instructions.md does not mirror README.md"
  exit 1
fi

# Check PDF naming conventions
# Find all pdf files that do NOT match the "Market Research -[0-9]+.pdf" pattern
INVALID_PDFS=$(find . -maxdepth 1 -name "*.pdf" ! -name "Market Research -*.pdf")

if [ -n "$INVALID_PDFS" ]; then
  echo "Error: The following PDF files do not follow the naming convention (Market Research -X.pdf):"
  echo "$INVALID_PDFS"
  exit 1
else
  echo "All PDF files follow the correct naming convention."
fi

# Check for lowercase 'market' or missing space etc specifically if you want stricter regex check
# Since we just want to ensure it starts with 'Market Research -'
# The above -name "Market Research -*.pdf" handles the basic convention.
# Let's ensure no lowercase "market Research" exists
LOWERCASE_PDFS=$(find . -maxdepth 1 -name "market Research*.pdf")
if [ -n "$LOWERCASE_PDFS" ]; then
  echo "Error: Found incorrectly capitalized PDF files:"
  echo "$LOWERCASE_PDFS"
  exit 1
fi

echo "All conventions checked successfully."
exit 0
