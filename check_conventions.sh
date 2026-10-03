#!/bin/bash

# Check if all .pdf files start with "Market Research "
all_pdfs_match=true
for file in *.pdf; do
    if [[ ! "$file" =~ ^"Market Research " ]]; then
        echo "Error: PDF file does not follow naming convention: $file"
        all_pdfs_match=false
    fi
done

if ! $all_pdfs_match; then
    echo "Validation failed: Some PDF files do not follow the 'Market Research ' naming convention."
    exit 1
fi

echo "All PDF files follow naming convention."

# Check if instructions.md perfectly mirrors README.md
if cmp -s README.md instructions.md; then
    echo "instructions.md perfectly mirrors README.md."
else
    echo "Error: instructions.md does not perfectly mirror README.md."
    exit 1
fi

echo "Validation passed."
exit 0
