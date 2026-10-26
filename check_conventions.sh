#!/bin/bash

# Exit with failure by default, change to 0 if all passes
exit_code=0

# Check PDF naming convention
echo "Checking PDF naming conventions..."
invalid_pdfs=$(find . -maxdepth 1 -name "*.pdf" ! -name "Market Research -*.pdf")

if [ -n "$invalid_pdfs" ]; then
    echo "Error: The following PDF files do not match the required naming convention ('Market Research -X.pdf'):"
    echo "$invalid_pdfs"
    exit_code=1
else
    echo "All PDF files match the naming convention."
fi

# Check if instructions.md perfectly mirrors README.md
echo "Checking if instructions.md mirrors README.md..."
if cmp -s README.md instructions.md; then
    echo "instructions.md perfectly mirrors README.md."
else
    echo "Error: instructions.md does not mirror README.md."
    exit_code=1
fi

exit $exit_code
