#!/bin/bash

# Check if a notebook filename is provided as an argument
if [ "$#" -ne 1 ]; then
    echo "Usage: tools --remove_notebook_output <notebook_name_without_extension>"
    exit 1
fi

# Assign the provided notebook filename (without extension)
notebook_filename="$1.ipynb"

# Search for the notebook file from the current directory
echo "Searching for $notebook_filename in the current directory and its subdirectories..."
notebook_path=$(find . -type f -name "$notebook_filename" -print -quit)

# Check if the notebook file was found
if [[ -n $notebook_path ]]; then
    echo "Removing outputs from $notebook_path..."
    
    # Use Python to clear outputs and save to the same file
    python -c "
import json

notebook_path = '$notebook_path'
try:
    with open(notebook_path, 'r') as f:
        nb = json.load(f)
    for cell in nb.get('cells', []):
        cell['outputs'] = []
    with open(notebook_path, 'w') as f:
        json.dump(nb, f, indent=2)
    print(f'Outputs removed from {notebook_path}')
except FileNotFoundError:
    print(f'Error: File not found: {notebook_path}')
except Exception as e:
    print(f'Error processing notebook: {e}')
    "
else
    echo "File $notebook_filename not found in the current directory or its subdirectories."
    exit 1  # Exit with an error code to signal that the file wasn't found
fi

