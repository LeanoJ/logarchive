# Log Archive Script

This script allows you to create, extract, and list the contents of tar archives. It also provides an option to delete the specified directory after creating the archive.

## Installation

To use this script as a CLI command, move it to `/usr/local/bin` and rename it to `log-archive`:

```bash
sudo mv script.sh /usr/local/bin/log-archive
sudo chmod +x /usr/local/bin/log-archive
```

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

1. Create an archive named `backup` from the `/home/user/documents` directory:
    ```bash
    log-archive create backup /home/user/documents
    ```

2. Create an archive named `logs` from the `/var/log` directory:
    ```bash
    log-archive create logs /var/log
    ```

3. Create an archive named `project` from the `/home/user/project` directory and remove the directory after archiving:
    ```bash
    log-archive create project /home/user/project --remove
    ```

### Extract Operation

1. Extract the `backup.tar.gz` archive into the `/home/user/restore` directory:
    ```bash
    log-archive extract backup.tar.gz /home/user/restore
    ```

2. Extract the `logs.tar.gz` archive into the `/var/logs/restore` directory:
    ```bash
    log-archive extract logs.tar.gz /var/logs/restore
    ```

### List Operation

1. List the contents of the `backup.tar.gz` archive:
    ```bash
    log-archive list backup.tar.gz
    ```

2. List the contents of the `logs.tar.gz` archive:
    ```bash
    log-archive list logs.tar.gz
    ```

3. List the contents of the `project.tar.gz` archive:
    ```bash
    log-archive list project.tar.gz
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
