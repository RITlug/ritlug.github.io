#!/usr/bin/env sh
#
# Create development environment using a Docker or Podman container
#

JEKYLL_VERSION=3.8

DOCKER_INSTALLED=0
PODMAN_INSTALLED=0

choice=0

# Ensure _site directory is created for Jekyll engine
if [ ! -d ./_site ]; then
    mkdir ./_site
fi

# Ensure  .bundle-cache exists for Podman
if [ ! -d ./.bundle-cache ]; then
    mkdir ./.bundle-cache
fi

# Check if docker is installed
if command -v docker &> /dev/null; then
    DOCKER_INSTALLED=1
fi

# Check if podman is installed
if command -v podman &> /dev/null; then
    PODMAN_INSTALLED=1
fi

ANDED=$(( $DOCKER_INSTALLED & $PODMAN_INSTALLED ))

# If both are installed then prompt the user to choose one
if (( $ANDED == 1 )); then
    echo -e "Both Docker \033[1;31m(0)\033[0m and Podman \033[1;31m(1)\033[0m seem to be installed, which would you like to use?"
    echo -n -e "\033[1;31m(0, 1)\033[0m - "
    read choice

    case $choice in
        0)
            # Serve the site via Docker and update site when files changed in repo
            docker run --rm \
                -p 4000:4000 \
                -v "$PWD:/srv/jekyll:Z" \
                -v "$PWD/.bundle-cache:/usr/local/bundle" \
                -it "jekyll/jekyll:$JEKYLL_VERSION" \
                sh -c "jekyll serve --watch"
            ;;
        1)
            # Serve the site via Podman and update site when files changed in repo
            podman run --rm \
                -p 4000:4000 \
                -v "$PWD:/srv/jekyll:Z" \
                -v "$PWD/.bundle-cache:/usr/local/bundle" \
                -it "docker.io/jekyll/jekyll:$JEKYLL_VERSION" \
                sh -c "jekyll serve --watch"
            ;;
        *)
            echo "Invalid option selected, please try again. (Or press C-c to exit)..."
            ;;
    esac

# Executing Docker if Podman isn't installed
elif (( $DOCKER_INSTALLED == 1 )); then
    echo "Detected Docker installation, using that..."
    # Serve the site via Docker and update site when files changed in repo
    docker run --rm \
        -p 4000:4000 \
        -v "$PWD:/srv/jekyll:Z" \
        -v "$PWD/.bundle-cache:/usr/local/bundle" \
        -it "jekyll/jekyll:$JEKYLL_VERSION" \
        sh -c "jekyll serve --watch"

# Executing Podman if Docker isn't installed
elif (( $PODMAN_INSTALLED == 1 )); then
    echo "Detected Podman installation, using that..."
    # Serve the site via Podman and update site when files changed in repo
    podman run --rm \
        -p 4000:4000 \
        -v "$PWD:/srv/jekyll:Z" \
        -v "$PWD/.bundle-cache:/usr/local/bundle" \
        -it "docker.io/jekyll/jekyll:$JEKYLL_VERSION" \
        sh -c "jekyll serve --watch"
else
    echo "You don't appear to have Docker or Podman installed."
fi
