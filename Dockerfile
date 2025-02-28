FROM nginx:alpine3.21 AS nginx-default
# use additional context called final-project and copy out the docs folder contents to the nginx default html folder
RUN rm -rf /usr/share/nginx/html/*
COPY --from=final-project docs/ /usr/share/nginx/html/

# run this on the terminal "docker build -t fpi:latest --build-context final-project=https://github.com/Mehrdad7174/pages-site.git ." to build the image