# Log Archive Script

This script allows you to create, extract, and list the contents of tar archives. It also provides an option to delete the specified directory after creating the archive.
https://roadmap.sh/projects/log-archive-tool

## Installation

To install the `log-archive` CLI tool, run the following command:

```bash
curl -s https://github.com/LeanoJ/logarchive/blob/main/install.sh | bash
```

The script will install the tool system-wide (in `/usr/local/bin`) or just for the user (in `~/bin`). For system-wide installation, sudo may be required. If using `~/bin`, make sure this directory is included in the PATH.

## Usage

```bash
log-archive <operation> <archive_name> <directory> [--remove]
```

### Operations

- `create` : Creates a tar archive from a directory
- `extract` : Extracts a tar archive into a target directory
- `list` : Lists the contents of a tar archive

### Options

- `--remove` : Deletes the specified directory after creating the archive
- `--help` : Shows the help message

## Examples

### Create Operation

1. Create an archive named `logs` from the `/var/log` directory:
    ```bash
    log-archive create logs /var/log
    ```

2. Create an archive named `project` from the `/home/user/project` directory and remove the directory after archiving:
    ```bash
    log-archive create project /home/user/project --remove
    ```

### Extract Operation

1. Extract the `logs.tar.gz` archive into the `/var/logs/restore` directory:
    ```bash
    log-archive extract logs.tar.gz /var/logs/restore
    ```

### List Operation

1. List the contents of the `backup.tar.gz` archive:
    ```bash
    log-archive list backup.tar.gz
    ```
  
    
## Help

To display the help message, use:

```bash
log-archive --help
```

## Error Handling

- If the specified directory does not exist during the `create` operation, an error message will be displayed.
- If the specified archive does not exist during the `extract` or `list` operations, an error message will be displayed.
- If insufficient arguments are provided, the help message will be displayed.

## License

This project is licensed under the MIT License.
