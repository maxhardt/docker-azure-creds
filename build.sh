#!/bin/bash

# optionally make token file
# echo $AZURE_ACCESS_TOKEN >> azure_token.txt

# assumes text file ./azure_token.txt exists
# and contains Azure personal access token

# build and install from azure
docker build \
    --tag azure-creds:latest \
    --file ./Dockerfile-azure \
    --secret id=azure_token,src=azure_token.txt \
    --progress=plain \
    --no-cache \
    ./
