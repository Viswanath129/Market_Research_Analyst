#!/bin/bash

# Check if instructions.md exactly matches README.md
if ! cmp -s README.md instructions.md; then
  echo "Error: instructions.md does not exactly match README.md."
  exit 1
fi

# Check if any PDF does not start with "Market Research -"
BAD_PDFS=$(find . -maxdepth 1 -name "*.pdf" ! -name "Market Research -*.pdf")

if [ -n "$BAD_PDFS" ]; then
  echo "Error: The following PDFs do not follow the naming convention 'Market Research -*.pdf':"
  echo "$BAD_PDFS"
  exit 1
fi

echo "All conventions are met!"
exit 0
