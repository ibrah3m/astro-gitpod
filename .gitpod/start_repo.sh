#!/bin/bash

set -eu

# Set up a given DDEV_REPO repository in gitpod (default to d9simple)
export ASTRO_REPO=${ASTRO_REPO:-https://github.com/drud/d9simple}
echo "Checking out repository ${DDEV_REPO}"
reponame=${ASTRO_REPO##*/}
reponame="${reponame//_/-}"
git clone ${ASTRO_REPO} ${GITPOD_REPO_ROOT}/${reponame}
if [ -d ${GITPOD_REPO_ROOT}/${reponame} ]; then
  cd ${GITPOD_REPO_ROOT}/${reponame}


# Wait for VSCode to be ready (port 23000)
gp ports await 23000 > /dev/null 2>&1

# Open the main page in VSCode
code src/pages/index.astro
#check if there's need to install the libraries ?

# Start Astro
pnpm start
