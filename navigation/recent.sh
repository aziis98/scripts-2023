#!/bin/bash

# [Script] @Link ~/.local/bin/recent

# Function to display the help message
display_help() {
  echo "Usage: $0 [-d|--depth <depth>] [directory]"
  echo "List folders in a directory recursively at a specified depth level, sorted by the most recent modification date."
  echo
  echo "Options:"
  echo "  -d, --depth <depth>  Specify the depth level for directory search (default: 1)"
  echo "  -h, --help           Display this help message"
  exit 1
}

# Set default values
depth=1
directory="."

# Parse command-line options
while [[ $# -gt 0 ]]; do
  case "$1" in
    -d|--depth)
      depth="$2"
      shift 2
      ;;
    -h|--help)
      display_help
      ;;
    *)
      directory="$1"
      shift
      ;;
  esac
done

# Verify depth option is provided
if [ -z "$directory" ]; then
  echo "Directory parameter is required."
  display_help
fi

# Perform the directory search and display
lines=$(tput lines)
find "$directory" -mindepth "$depth" -maxdepth "$depth" -type d -printf "%TY-%Tm-%Td %TH:%TM %p\n" | sort -r | head -n $((lines - 2))

