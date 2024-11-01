#!/bin/bash

# Ask for the name of the Jupyter notebook (without the .ipynb extension)
read -p "Enter the name of the Jupyter notebook (without .ipynb): " notebook_name

# Add the .ipynb extension to the notebook name
notebook_file="${notebook_name}.ipynb"

# Check if the specified notebook exists in the current directory
if [[ -e $notebook_file ]]; then
    echo "Clearing outputs from $notebook_file..."

    # Use Python to clear outputs without external libraries
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
else
    echo "Error: $notebook_file not found in the current directory."
fi
