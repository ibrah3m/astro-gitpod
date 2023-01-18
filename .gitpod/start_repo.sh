#!/bin/bash
reponame="ASTRO_REPO"
if [ "$TASK" == "init" ]; then
# Set up a given ASTRO_REPO repository in gitpod (default to astro template)
export ASTRO_REPO=${ASTRO_REPO:-https://github.com/astro/template}
echo "Checking out repository ${ASTRO_REPO}"

git clone ${ASTRO_REPO} ${GITPOD_REPO_ROOT}/${reponame}
if [ -d ${GITPOD_REPO_ROOT}/${reponame} ]; then
  cd ${GITPOD_REPO_ROOT}/${reponame}
  pnpm install
  pnpm run build
    fi
    fi
    
    
if [ "$(pwd)" != ${GITPOD_REPO_ROOT}/${reponame} ]; then
    cd ${GITPOD_REPO_ROOT}/${reponame}
fi
    
# Wait for VSCode to be ready (port 23000)
gp ports await 23000 > /dev/null 2>&1

# Open the main page in VSCode
code src/pages/index.astro
#check if triggerd by init task from gitpod.yml

# Start Astro
pnpm start
