#!/bin/bash

# check_conventions.sh

# 1. Verify that all PDF files follow the naming convention: Market Research -*.pdf
# (Strictly speaking, "Market Research*.pdf" handles the capitalization part)
PDF_ERROR=0
for f in *.pdf; do
    # Skip if no pdf files
    [ -e "$f" ] || continue

    # Check if it starts with "Market Research"
    if [[ ! "$f" == Market\ Research* ]]; then
        echo "Error: PDF file does not follow naming convention (must start with 'Market Research'): $f"
        PDF_ERROR=1
    fi
done

if [ "$PDF_ERROR" -eq 1 ]; then
    echo "PDF naming convention check failed."
    exit 1
else
    echo "PDF naming convention check passed."
fi

# 2. Verify that instructions.md perfectly mirrors README.md
if [ ! -f "instructions.md" ]; then
    echo "Error: instructions.md does not exist."
    exit 1
fi

if [ ! -f "README.md" ]; then
    echo "Error: README.md does not exist."
    exit 1
fi

if diff -q README.md instructions.md > /dev/null; then
    echo "instructions.md correctly mirrors README.md."
else
    echo "Error: instructions.md does not perfectly mirror README.md."
    exit 1
fi

echo "All convention checks passed."
exit 0
