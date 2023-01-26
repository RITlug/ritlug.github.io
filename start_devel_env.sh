#!/usr/bin/env sh
#
# Create development environment using a Docker or Podman container
#

JEKYLL_VERSION=3.8

DOCKER_INSTALLED=0
PODMAN_INSTALLED=0

choice=0

function run_docker() {
    # Serve the site via Docker and update site when files changed in repo
    docker run --rm \
        -p 4000:4000 \
        -v "$PWD:/srv/jekyll:Z" \
        -v "$PWD/.bundle-cache:/usr/local/bundle" \
        -it "jekyll/jekyll:$JEKYLL_VERSION" \
        sh -c "jekyll serve --watch"
}

function run_podman() {
    # Serve the site via Podman and update site when files changed in repo
    podman run --rm \
        -p 4000:4000 \
        -v "$PWD:/srv/jekyll:Z" \
        -v "$PWD/.bundle-cache:/usr/local/bundle" \
        -it "docker.io/jekyll/jekyll:$JEKYLL_VERSION" \
        sh -c "jekyll serve --watch"
}

# Ensure _site directory is created for Jekyll engine
if [ ! -d ./_site ]; then
    mkdir ./_site
fi

# Ensure  .bundle-cache exists for Podman
if [ ! -d ./.bundle-cache ]; then
    mkdir ./.bundle-cache
fi

# Check if docker is installed
if command -v podman &> /dev/null; then
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

            run_docker

        elif (( $PODMAN_INSTALLED ==1 )); then
            echo "Detected Podman installation, using that..."

            run_podman

        else
            echo "It appears you don't have Docker or Podman installed. Please ensure it is installed and proceed with running the development environment."
        fi
    ;;
    1)
        invalid=0
        
        # Looping the user input in case they input an invalid number
        while [ $invalid -eq 0 ]; do
            # Goofy ANSI escape codes
            # What they mean:
            #
            # Full string:
            # \033[1;31m(0)\033[0m
            #
            # Broken down:
            #
            # \033
            #   ∟ Escape character in ANSI telling the terminal "Hey there's a color sequence coming up"
            #
            # [1;31m
            #   ∟ 1-Bold; 31m means red foreground `m` probably means end of sequence or something
            #
            # (0)
            #   ∟ The text displayed
            #
            # \033
            #   ∟ Escape character in ANSI telling the terminal "Hey there's a color sequence coming up"
            #
            # [0m
            #   ∟ Resetting the color back to normal cause if you don't it'll stay the previous color
            # 
            # Learn more here - https://stackoverflow.com/questions/4842424/list-of-ansi-color-escape-sequences
            # If the link's broken then either search "ANSI Color Sequences" or wayback machine

            echo -e "Both Docker \033[1;31m(0)\033[0m and Podman \033[1;31m(1)\033[0m seem to be installed, which would you like to use?"
            echo -n -e "\033[1;31m(0, 1)\033[0m - "
            read choice
            invalid=1

            # Caseing the choice for whether the user wants to use Podman or Docker
            case $choice in
                0)
                    run_docker
                ;;

                1)
                    run_podman
                ;;
                
                # If the user entered an invalid option it'll loop
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