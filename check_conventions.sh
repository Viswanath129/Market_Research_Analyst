#!/bin/bash

error=0

# Check if instructions.md perfectly mirrors README.md
if cmp -s README.md instructions.md; then
    echo "SUCCESS: instructions.md perfectly mirrors README.md."
else
    echo "ERROR: instructions.md does not perfectly mirror README.md."
    error=1
fi

# Check PDF naming conventions
shopt -s nullglob
pdfs=(*.pdf)
shopt -u nullglob

for pdf in "${pdfs[@]}"; do
    if [[ "$pdf" =~ ^Market\ Research\ -[0-9]+\.pdf$ ]]; then
        : # valid
    else
        echo "ERROR: PDF file '$pdf' does not follow the naming convention 'Market Research -X.pdf'."
        error=1
    fi
done

if [ $error -eq 0 ]; then
    echo "SUCCESS: All PDF files follow the correct naming convention."
fi

# Use standard exit mechanism
test $error -eq 0
