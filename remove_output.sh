#!/bin/bash

# Get the notebook name keyword from the argument
notebook_keyword="$1"

# Check if keyword was provided
if [[ -z "$notebook_keyword" ]]; then
    echo "Error: No notebook keyword provided."
    exit 1
fi

# Find the notebook file matching the keyword (assumes unique match)
notebook_file=$(find . -maxdepth 1 -type f -name "${notebook_keyword}.ipynb" | head -n 1)

# Check if notebook file was found
if [[ -z "$notebook_file" ]]; then
    echo "Error: No notebook file found matching keyword '$notebook_keyword'."
    exit 1
fi

echo "Clearing outputs from $notebook_file..."

# Use Python to clear outputs (as previously discussed)
python -c "
import json
with open('$notebook_file', 'r') as f:
    nb = json.load(f)
for cell in nb['cells']:
    if 'outputs' in cell:
        cell['outputs'] = []
with open('$notebook_file', 'w') as f:
    json.dump(nb, f, indent=2)
    "

echo "Outputs cleared and saved for $notebook_file."
