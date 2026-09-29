#!/bin/bash

# Check if instructions.md exactly mirrors README.md
if diff -q README.md instructions.md > /dev/null; then
    echo "Check passed: instructions.md perfectly mirrors README.md."
else
    echo "Check failed: instructions.md does not mirror README.md."
    exit 1
fi

# Check PDF naming conventions
# All PDF files should follow the pattern 'Market Research -<number>.pdf'
failed=0
for f in *.pdf; do
    if [[ ! "$f" =~ ^Market\ Research\ -[0-9]+\.pdf$ ]]; then
        echo "Check failed: PDF file naming convention violated by '$f'."
        failed=1
    fi
done

if [ $failed -eq 0 ]; then
    echo "Check passed: All PDF files follow the naming convention."
else
    exit 1
fi

echo "All checks passed."
exit 0
