#!/bin/bash

# check pdf files
EXIT_CODE=0
for f in *.pdf; do
    if [[ ! "$f" =~ ^Market\ Research\ -[0-9]+\.pdf$ ]]; then
        echo "Invalid PDF naming convention: $f"
        EXIT_CODE=1
    fi
done

# check if instructions.md mirrors README.md
if ! cmp -s README.md instructions.md; then
    echo "instructions.md does not mirror README.md"
    EXIT_CODE=1
fi

if [ $EXIT_CODE -eq 0 ]; then
    echo "All conventions checked successfully."
fi

exit $EXIT_CODE
