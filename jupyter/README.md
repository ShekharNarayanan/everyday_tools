# Jupyter Tools

Tools used with jupyter notebooks. Current functionalities include:
1. **Clear notebook output directly from a CLI**: useful for clearing notebooks with sensitive or long outputs before pushing to a repository/ sharing.

## Structure
```bash
everyday_tools/  
└── jupyter/  
    ├── src/           
    │   ├── remove_notebook_output.sh  
    │   └── jupyter_tools  
    └── examples/     
        └── example_notebook.ipynb  

```     
      
- **src/**: Contains shell scripts and tools for managing Jupyter notebooks. This includes:
  - `remove_notebook_output.sh`: A script that clears output cells from Jupyter notebooks.
  - `jupyter_tools`: A command-line tool that allows users to access the `remove_notebook_output.sh` from any working directory on their PC. Removes path dependencies of the tool.

- **examples/**:
  - `example_notebook.ipynb`: Includes an example Jupyter notebook with a random visualization. Can be used to test the tool.


## Installation

### Step 1: Clone the Repository

First, clone this repository to your local machine:

```bash
git clone https://github.com/ShekharNarayanan/everyday_tools.git
cd your/path/everyday_tools/jupyter
```
### Step 2: Copy Scripts to Your bin Folder
Copy the scripts from the src folder to your ~/bin directory. If you don’t have a bin folder in your home directory, create one:
```bash
mkdir -p ~/bin
cp src/remove_notebook_output.sh ~/bin/
cp src/jupyter_tools ~/bin/
```
### Step 3: Make the Scripts Executable
Make sure the copied scripts are executable:
```bash
chmod +x ~/bin/remove_notebook_output.sh
chmod +x ~/bin/jupyter_tools
```
### Step 4: Add ~/bin to Your System Path
If ~/bin is not already in your PATH, add it by updating your .bashrc (or .zshrc on macOS if you’re using Zsh):

**Windows**:
```bash
export PATH="$HOME/bin:$PATH"
source ~/.bashrc
```
**Linux**
```bash
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```
**macOS**
```bash
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

## Usage
Navigate to the project containing jupyter notebooks you wish to clear the output of (or this repository) and then:

```bash
jupyter_tools --remove_notebook_output "example_notebook"

```

_Future versions of the tool will include tests. Currently in the works_


