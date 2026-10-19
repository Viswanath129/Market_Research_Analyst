#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo "Running Repository Conventions Checks..."
echo "----------------------------------------"

# 1. Check PDF Naming Convention
echo "Checking PDF naming convention (should be 'Market Research -<number>.pdf')..."
PDF_ERROR=0
for file in *.pdf; do
    # Skip if no pdf files
    if [ "$file" = "*.pdf" ]; then
        echo "No PDF files found."
        break
    fi

    # Check if file starts with 'Market Research -' (case sensitive)
    if [[ ! "$file" =~ ^Market\ Research\ -[0-9]+\.pdf$ ]]; then
        echo -e "${RED}ERROR: Invalid PDF naming: '$file'${NC}"
        echo "Expected format: 'Market Research -<number>.pdf' (Note: 'Market' must be capitalized)"
        PDF_ERROR=1
    fi
done

if [ $PDF_ERROR -eq 0 ]; then
    echo -e "${GREEN}✓ All PDF files follow the correct naming convention.${NC}"
else
    echo -e "${RED}✗ PDF naming convention check failed.${NC}"
fi

echo "----------------------------------------"

# 2. Check README.md vs instructions.md mirror
echo "Checking if instructions.md mirrors README.md..."

if [ ! -f "README.md" ]; then
    echo -e "${RED}ERROR: README.md not found!${NC}"
    exit 1
fi

if [ ! -f "instructions.md" ]; then
    echo -e "${RED}ERROR: instructions.md not found!${NC}"
    exit 1
fi

if cmp -s "README.md" "instructions.md"; then
    echo -e "${GREEN}✓ instructions.md perfectly mirrors README.md.${NC}"
else
    echo -e "${RED}✗ ERROR: instructions.md does not match README.md!${NC}"
    echo "Please run 'cp README.md instructions.md' to fix this."
    exit 1
fi

echo "----------------------------------------"

if [ $PDF_ERROR -eq 0 ]; then
    echo -e "${GREEN}All checks passed successfully!${NC}"
    exit 0
else
    echo -e "${RED}Some checks failed. Please fix the issues above.${NC}"
    exit 1
fi
