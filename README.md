# PenDock

This is my slightly customized version of
[pendock](https://github.com/drtychai/pendock). That image is pushed to
docker cloud so this can build rather quickly.

## Customization
To customize this image, simply fork the repo and make changes to the _Dockerfile_ before building.

## Installation
1. Install Docker:  
  macOS: `brew cask install docker && brew install docker`  
  Ubuntu: `sudo apt update && sudo apt install docker-ce`  
  Windows: https://docs.docker.com/docker-for-windows/install/
2. Add customizations to the _Dockerfile_, and the other scripts if your desire, for example, to use a different name.
3. Build: `./build`

## Running it
Management:  
- `start` - Start the built image  
- `stop`  - Stop the running image
- `connect [COMMAND]` - Connect to the running container. A new `tmux` session is created by default.
