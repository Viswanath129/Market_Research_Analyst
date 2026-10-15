#!/bin/bash

# Check if instructions.md perfectly mirrors README.md
diff -q README.md instructions.md
if [ $? -ne 0 ]; then
    echo "Error: instructions.md does not mirror README.md exactly."
    exit 1
fi
echo "Success: instructions.md perfectly mirrors README.md."

# Check PDF naming convention
invalid_pdfs=$(find . -maxdepth 1 -name "*.pdf" -type f ! -name "Market Research -*.pdf")
if [ -n "$invalid_pdfs" ]; then
    echo "Error: The following PDF files do not follow the correct naming convention ('Market Research -*.pdf'):"
    echo "$invalid_pdfs"
    exit 1
fi
echo "Success: All PDF files follow the correct naming convention."

exit 0