# Docker Static App Deployment
This is a local deployment to run server-side PHP on using FastCGI process Manager together with an NGINX web server.

## Architecture
- requests to `http://localhost:8089` get handled by the `http-svc`
- if it encounters php files, is executes them using the `php-svc` over the docker network on port `9000`
- php uses the MySQL db to handle database access by calling `db-svc` on the port specified in the `.env` file

## Prerequisties
- Docker version 27.4.0, build bde2b89
- MacOS (for windows you need to modify some of the commands)
- sh shell with typing tools

## Testing Notes
- Tested on MacOS
- Tested with Docker version 27.4.0 build bde2b89
- Tested with zsh Bash

## Usage 
1. Rename [db.env.template](db.env.template) to be called `db.env` and customize the username, password and port.

2. Initialze the file structure and volumes.
```bash
source ./scripts/init.sh
```
3. After any modifing on your `init.sh` you should run `step 7` and then build image:
    ```bash
    docker build -t fpi:latest --build-context final-project=your-github-repo-address .
    ```
    **Note**: be sure to rerun this if you want to delete the data for the db so that it will initilize on up-ing the stack.
4. To up the compose stack:
    ```bash
    docker compose up -d
    ```
5. Visit the homepage by going to [localhost:8089](http://localhost:8089) in the browser.
6. Click the link you find on the homepage. You should see the PHP info with some purple coloring.

7. To down the compose stack
    ```bash
    docker compose down
    ```
