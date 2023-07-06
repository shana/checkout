#!/bin/sh

if [ ! -f "./treeless/basic-file.txt" ]; then
    echo "Expected basic file does not exist"
    exit 1
fi

if [ "$1" = "--archive" ]; then
  # Verify no .git folder
  if [ -d "./treeless/.git" ]; then
    echo "Did not expect ./treeless/.git folder to exist"
    exit 1
  fi
else
  # Verify .git folder
  if [ ! -d "./treeless/.git" ]; then
    echo "Expected ./treeless/.git folder to exist"
    exit 1
  fi

  # Verify auth token
  cd treeless
  git fetch --no-tags --depth=1 origin +refs/heads/main:refs/remotes/origin/main
fi
