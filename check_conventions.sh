#!/bin/bash

# Check PDF naming conventions
error=0
for f in *.pdf; do
    if [[ ! "$f" =~ ^Market\ Research\ -[0-9]+\.pdf$ ]]; then
        echo "Error: File '$f' does not follow the naming convention 'Market Research -X.pdf'"
        error=1
    fi
done

# Check if instructions.md mirrors README.md
if ! cmp -s README.md instructions.md; then
    echo "Error: instructions.md does not perfectly mirror README.md"
    error=1
fi

if [ $error -eq 0 ]; then
    echo "All conventions are followed."
    exit 0
else
    exit 1
fi
