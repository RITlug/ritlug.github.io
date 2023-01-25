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

# Checking the ANDed value of the Docker and Podman variables
case $ANDED in
    # If it's 0, that means one of them is installed (or neither)
    0)
        if (( $DOCKER_INSTALLED == 1 )); then
            echo "Detected Docker installation, using that..."

            # Serve the site via Docker and update site when files changed in repo
            docker run --rm \
                -p 4000:4000 \
                -v "$PWD:/srv/jekyll:Z" \
                -v "$PWD/.bundle-cache:/usr/local/bundle" \
                -it "jekyll/jekyll:$JEKYLL_VERSION" \
                sh -c "jekyll serve --watch"

        elif (( $PODMAN_INSTALLED ==1 )); then
            echo "Detected Podman installation, using that..."

            # Serve the site via Podman and update site when files changed in repo
            podman run --rm \
                -p 4000:4000 \
                -v "$PWD:/srv/jekyll:Z" \
                -v "$PWD/.bundle-cache:/usr/local/bundle" \
                -it "docker.io/jekyll/jekyll:$JEKYLL_VERSION" \
                sh -c "jekyll serve --watch"
        else
            echo "It appears you don't have Docker or Podman installed. Please ensure it is installed and proceed with running the development environment."
        fi
    ;;
    1)
        invalid=0

        while [ $invalid -eq 0 ]; do
            echo -e "Both Docker \033[1;31m(0)\033[0m and Podman \033[1;31m(1)\033[0m seem to be installed, which would you like to use?"
            echo -n -e "\033[1;31m(0, 1)\033[0m - "
            read choice
            invalid=1

            # Caseing the choice for whether the user wants to use Podman or Docker
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
                
                # If the user entered an invalid option it'll exit
                *)
                    echo "Invalid option selected, please try again. (Or press C-c to exit)..."
                    invalid=0
                ;;
            esac
        done
    ;;
    
    # Default case for if something bad happens, and if something bad happens then something bad happened.
    *)
        echo "An Unknown Error occurred, please report this to the maintainers..."
    ;;
esac