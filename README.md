# Docker Static App Deployment
This is a local deployment to serve the GitHub Pages app of [mehrdad7174.github.io/pages-site](https://mehrdad7174.github.io/pages-site)

## Architecture
- requests to `http://localhost:8081` get routed to the `fp-svc` which has a webserver on port `7901` 
    - for `http://fp-svc:7901/`, the container proxies to `hhtp://hp-svc:6969/`
    - for `http://fp-svc:7901/pages-site`, the container serves the pages site stored inside the image at `/usr/share/nginx/html` (this came from a Git repo)
- the `hp-svc` serves a landing page on `port 6969` that comes from a volume and has a link to `http://localhost:8081/pages-site/`

## Prerequisties
- Docker version 27.4.0, build bde2b89
- MacOS (for windows you need to modify some of the commands)
- sh shell with typing tools and perl

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
4. Visit the homepage by going to [localhost:8081](http://localhost:8081) in the browser.
5. Click the link you find on the homepage.
6. To monitor servecies, attach to the watchdog and curl different services.
    ```bash
    docker compose attach watchdog-svc
    ```
    (From inside watchdog-c)
    ```sh
    apk add curl
    curl http://fp-svc:7901/ # proxied to http://hp-svc:6969/
    curl http://hp-svc:6969/ # hits http://hp-svc:6969/
    curl http://fp-svc:7901/pages-site/ # hit the pages site
    ```
    use `control + d` to exit and restart that main shell process
7. To down the compose stack
    ```bash
    docker compose down
    ```
