#!/bin/bash

# Check if an argument is passed
if [ $# -eq 0 ]; then
  echo "Error: You must provide a path to a directory."
  return 1
fi

# Store the first argument (path)
DIR_PATH="$1"

# Verify the argument is a valid directory
if [ ! -d "$DIR_PATH" ]; then
  echo "Error: '$DIR_PATH' is not a valid directory."
  return 1
fi

# Resolve absolute paths for the directories relative to the passed directory
ROOT_DIR=($realpath "$DIR_PATH")
APP_DIR=$(realpath "$DIR_PATH/app")
DATA_WRAPPER_DIR=$(realpath "$DIR_PATH/data-wrapper")
PROVIDERS_DIR=$(realpath "$DIR_PATH/providers")

# Export environment variables
export TEST_MODE=1
export PYTHONPATH="$ROOT_DIR:$APP_DIR:$DATA_WRAPPER_DIR:$PROVIDERS_DIR"

# Output the values of PYTHONPATH and TEST_MODE
echo "PYTHONPATH=$PYTHONPATH"
echo "TEST_MODE=$TEST_MODE"

