#!/bin/bash

# Check if 3 arguments are provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <input_file> <keyword> <output_file>"
    exit 1
fi

INPUT_FILE="$1"
KEYWORD="$2"
OUTPUT_FILE="$3"

# Extract matching lines into output file (case-insensitive)
grep -Ei "${KEYWORD}($|\?)" "$INPUT_FILE" > "$OUTPUT_FILE"

# Remove those lines from original input file
grep -vFf "$OUTPUT_FILE" "$INPUT_FILE" > temp.txt && mv temp.txt "$INPUT_FILE"

echo "[+] Lines matching '$KEYWORD' moved to $OUTPUT_FILE"
echo "[+] $INPUT_FILE updated without those lines"
