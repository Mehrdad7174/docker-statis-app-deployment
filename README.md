# Docker Static App Deployment

This is a local deployment to run server-side php scripts integerated with an NGINX web server.

## Architecture
An NGINX container servers HTTP trafic on port 8080 and uses a PHP-FPM container to run PHP scripts.
## Prerequisties
- Docker version 27.4.0, build bde2b89
- MacOS (for windows you need to modify some of the commands)
- sh shell with typing tools

## Testing Notes
- Tested on MacOS
- Tested with Docker version 27.4.0 build bde2b89
- Tested with zsh Bash

## Usage 
1. Initialze the file structure and volumes.
```bash
source ./scripts/init.sh
```

2. To up the compose stack:
    ```bash
    docker compose up -d
    ```

3. To down the compose stack
    ```bash
    docker compose down
    ```
