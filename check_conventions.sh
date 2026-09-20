#!/bin/bash

# Check PDF naming convention
echo "Checking PDF naming convention..."
invalid_pdfs=0
for file in *.pdf; do
    if ! [[ "$file" =~ ^Market\ Research\ -[0-9]+\.pdf$ ]]; then
        echo "Error: File '$file' does not match the naming convention 'Market Research -<number>.pdf'"
        invalid_pdfs=$((invalid_pdfs+1))
    fi
done

if [ "$invalid_pdfs" -gt 0 ]; then
    echo "Found $invalid_pdfs file(s) with incorrect naming conventions."
    exit 1
else
    echo "All PDF files match the naming convention."
fi

# Check if instructions.md mirrors README.md
echo "Checking if instructions.md mirrors README.md..."
if ! diff -q README.md instructions.md > /dev/null; then
    echo "Error: instructions.md does not exactly mirror README.md"
    exit 1
else
    echo "instructions.md perfectly mirrors README.md."
fi

echo "All checks passed!"
exit 0
