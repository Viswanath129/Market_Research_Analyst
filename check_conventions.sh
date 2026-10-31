#!/bin/bash

# Check PDF naming conventions
pdf_errors=0
for f in *.pdf; do
    if [[ ! "$f" =~ ^Market\ Research\ -[0-9]+\.pdf$ ]]; then
        echo "Error: PDF file '$f' does not follow the naming convention 'Market Research -X.pdf'."
        pdf_errors=1
    fi
done

if [[ $pdf_errors -eq 0 ]]; then
    echo "All PDF files follow the naming convention."
fi

# Check if instructions.md mirrors README.md
if diff -q README.md instructions.md > /dev/null; then
    echo "instructions.md perfectly mirrors README.md."
else
    echo "Error: instructions.md does not mirror README.md."
    exit 1
fi

if [[ $pdf_errors -eq 1 ]]; then
    exit 1
fi

exit 0
