#!/bin/bash

# Check if instructions.md exactly mirrors README.md
diff_output=$(diff README.md instructions.md)
if [ "$?" -ne 0 ] || [ -n "$diff_output" ]; then
    echo "Error: instructions.md does not perfectly mirror README.md"
    exit 1
fi

# Check PDF naming conventions
# All PDF files should match 'Market Research -*.pdf'
for f in *.pdf; do
    # Ignore if no pdf files
    if [ "$f" = "*.pdf" ]; then
        break
    fi

    if [[ ! "$f" =~ ^Market\ Research\ -[0-9]+\.pdf$ ]]; then
        echo "Error: PDF file '$f' does not follow the naming convention 'Market Research -X.pdf'"
        exit 1
    fi
done

echo "All conventions passed."
exit 0
