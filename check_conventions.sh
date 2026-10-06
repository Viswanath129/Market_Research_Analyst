#!/bin/bash

fail=0

# Check that all PDF files follow the naming convention (start with 'Market Research')
for file in *.pdf; do
    if [[ ! $file == Market\ Research* ]]; then
        echo "Error: PDF file '$file' does not match naming convention 'Market Research*'."
        fail=1
    fi
done

# Check that instructions.md perfectly mirrors README.md
if ! cmp -s README.md instructions.md; then
    echo "Error: instructions.md does not perfectly mirror README.md."
    fail=1
fi

if [ $fail -eq 1 ]; then
    echo "Convention checks failed."
    exit 1
else
    echo "All convention checks passed successfully."
    exit 0
fi
