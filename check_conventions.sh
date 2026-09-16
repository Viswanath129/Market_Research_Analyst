#!/bin/bash

# Check if instructions.md mirrors README.md
diff -q README.md instructions.md > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Error: instructions.md does not perfectly mirror README.md"
    exit 1
fi
echo "Success: instructions.md mirrors README.md"

# Check PDF naming convention (should start with 'Market Research -')
PDF_ERROR=0
for f in *.pdf; do
    # Skip if no pdf files exist (f evaluates to '*.pdf')
    if [ "$f" = "*.pdf" ]; then
        break
    fi

    # Check if it starts with exactly 'Market Research -'
    # By strictly matching the expected prefix
    if [[ ! "$f" == Market\ Research\ -* ]]; then
        echo "Error: PDF file '$f' does not follow the correct naming convention. It should start with 'Market Research -'."
        PDF_ERROR=1
    fi
done

if [ $PDF_ERROR -ne 0 ]; then
    exit 1
fi
echo "Success: All PDF files follow the correct naming convention."

exit 0
