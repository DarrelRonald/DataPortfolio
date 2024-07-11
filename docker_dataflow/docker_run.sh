#!/bin/bash

# Source the .env file if it exists
if [ -f .env ];
then
    source .env
    #export "$(cat .env | grep -v '^#' | xargs)"
else
    echo ".env file not found!"
    exit 1
fi

# Print loaded variables (optional for debugging)
echo "IMAGE_NAME: $IMAGE_NAME"
echo "CONTAINER_NAME: $CONTAINER_NAME"
echo "HOST_PATH: $HOST_PATH"
echo "CONTAINER_PATH: $CONTAINER_PATH"

# Check if the container is already running
echo "----------------------------------------------------------------"
if [ $(docker ps -q -f name=$CONTAINER_NAME) ];
then
    echo "Container ""$CONTAINER_NAME"" is already running. Stopping it now."
    docker stop "$CONTAINER_NAME"
fi

echo "----------------------------------------------------------------"
# Check if the container exists (but is not running)
if [ $(docker ps -aq -f name=$CONTAINER_NAME) ];
then
    echo "Container $CONTAINER_NAME exists. Removing it now."
    docker rm "$CONTAINER_NAME"
fi

echo "----------------------------------------------------------------"
# Run the Docker container
echo "Running the Docker container $CONTAINER_NAME from image $IMAGE_NAME."
docker run -dit --name "$CONTAINER_NAME" -v "$HOST_PATH":"$CONTAINER_PATH" "$IMAGE_NAME" bash

