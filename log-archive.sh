#!/bin/bash

# Help function
function show_help() {
    echo "Usage: $0 <operation> <archive_name> <directory>"
    echo "Operations:"
    echo "  create   : Creates a tar archive from a directory"
    echo "  extract  : Extracts a tar archive into a target directory"
    echo "  list     : Lists the contents of a tar archive"
    echo "Options:"
    echo "  --remove   : Deletes the specified directory after creating the archive"
    echo "  --help   : Shows this help message"
    exit 1
}

# Check if the user requested --help
if [[ "$1" == "--help" ]]; then
    show_help
fi

# Check if enough arguments were provided
if [ $# -lt 2 ]; then
    show_help
fi

operation=$1
archive_name=$2
directory=$3

case $operation in
    create)
        if [ -z "$directory" ]; then
            echo "Error: A directory must be specified."
            exit 1
        fi
        if [ ! -d "$directory" ]; then
            echo "Error: The specified directory does not exist."
            exit 1
        fi
        echo "Creating archive: $archive_name from directory: $directory"
        tar -czf "$archive_name.tar.gz" -C "$directory" .
        echo "Archive created: $archive_name.tar.gz"
        ;;
    extract)
        if [ -z "$directory" ]; then
            echo "Error: A target directory must be specified."
            exit 1
        fi
        if [ ! -f "$archive_name" ]; then
            echo "Error: The specified archive does not exist."
            exit 1
        fi
        echo "Extracting archive: $archive_name into directory: $directory"
        tar -xzf "$archive_name" -C "$directory"
        if [ $? -eq 0 ]; then
            echo "Archive successfully extracted."
        else
            echo "Error extracting the archive."
            exit 1
        fi
        if [[ "$4" == "--remove" ]]; then
            echo "Deleting the archive: $archive_name"
            rm "$archive_name"
        fi
        ;;
    list)
        if [ ! -f "$archive_name" ]; then
            echo "Error: The specified archive does not exist."
            exit 1
        fi
        echo "Contents of the archive $archive_name:"
        tar -tf "$archive_name"
        ;;
    *)
        show_help
        ;;
esac
