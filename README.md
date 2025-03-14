# Docker Static App Deployment
This is a local deployment to run server-side PHP on using FastCGI process Manager together with an NGINX web server.

## Architecture
- requests to `http://localhost:8089` get handled by the `http-svc`
- if it encounters php files, is executes them using the `php-svc` over the docker network on port `9000`

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
2. After any modifing on your `init.sh` you should run `step 7` and then build image:
    ```bash
    docker build -t fpi:latest --build-context final-project=your-github-repo-address .
    ```
3. To up the compose stack:
    ```bash
    docker compose up -d
    ```
4. Visit the homepage by going to [localhost:8089](http://localhost:8089) in the browser.
5. Click the link you find on the homepage. You should see the PHP info with some purple coloring.

6. To down the compose stack
    ```bash
    docker compose down
    ```
