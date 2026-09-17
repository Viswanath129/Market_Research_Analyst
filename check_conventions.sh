#!/bin/bash

# Check if instructions.md mirrors README.md
if cmp -s README.md instructions.md; then
    echo "instructions.md mirrors README.md"
else
    echo "Error: instructions.md does not mirror README.md"
    exit 1
fi

# Check PDF naming convention
FAILED_PDF=0
for pdf in *.pdf; do
    # Ignore if no pdfs exist
    [ -e "$pdf" ] || continue

    # Check if the filename starts with "Market Research"
    if [[ ! "$pdf" == Market\ Research* ]]; then
        echo "Error: PDF file '$pdf' does not follow the naming convention (should start with 'Market Research')."
        FAILED_PDF=1
    fi
done

if [ "$FAILED_PDF" -eq 1 ]; then
    exit 1
fi

echo "All conventions followed."
exit 0
