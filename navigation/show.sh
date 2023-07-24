#!/bin/bash

# [Script] @Link ~/.local/bin/show

# Check if the input is a folder or file
if [ -d "$1" ]; then
    # Input is a folder
    folder_path="$1"

    # List the contents of the folder
    ${SHOW_DIR_COMMAND:-ls -Al} "$folder_path"

elif [ -f "$1" ]; then
    # Input is a file
    file_path="$1"

    # Display the file contents using the pager
    ${SHOW_FILE_COMMAND:-less} "$file_path"
else
    # Invalid input or file/folder not found
    echo "usage: $0 <path>"
fi
