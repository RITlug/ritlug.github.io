#!/bin/bash
#
# Create development environment using a Docker container
#

JEKYLL_VERSION=3.8

# Ensure _site directory is created for Jekyll engine
if [ ! -d ./_site ]; then
    mkdir ./_site
fi

# Serve the site via Docker and update site when files changed in repo
docker run --rm \
    -p 4000:4000 \
    -v "$PWD:/srv/jekyll:Z" \
    -v "$PWD/.bundle-cache:/usr/local/bundle" \
    -it "jekyll/jekyll:$JEKYLL_VERSION" \
    sh -c "jekyll serve --watch"
