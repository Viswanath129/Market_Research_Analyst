#!/bin/bash

# Check if instructions.md mirrors README.md
diff README.md instructions.md > /dev/null
if [ $? -ne 0 ]; then
    echo "Error: instructions.md does not mirror README.md"
    exit 1
fi

# Check PDF naming convention
for file in *.pdf; do
    if [[ ! "$file" =~ ^Market\ Research\ -[0-9]+\.pdf$ ]]; then
        echo "Error: File $file does not follow naming convention 'Market Research -X.pdf'"
        exit 1
    fi
done

echo "All checks passed!"
exit 0
