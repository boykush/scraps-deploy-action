#!/bin/bash
set -e
set -o pipefail

# For backwards compatibility
if [[ -n "$TOKEN" ]]; then
    GITHUB_TOKEN=$TOKEN
fi

if [[ -z "$PAGES_BRANCH" ]]; then
    PAGES_BRANCH="gh-pages"
fi

if [[ -z "$BUILD_DIR" ]]; then
    BUILD_DIR="."
fi

if [[ -z "$OUT_DIR" ]]; then
    OUT_DIR="public"
fi

if [[ -n "$REPOSITORY" ]]; then
    TARGET_REPOSITORY=$REPOSITORY
else
    if [[ -z "$GITHUB_REPOSITORY" ]]; then
        echo "Set the GITHUB_REPOSITORY env variable."
        exit 1
    fi
    TARGET_REPOSITORY=${GITHUB_REPOSITORY}
fi

if [[ -z "$GITHUB_TOKEN" ]] && [[ "$BUILD_ONLY" == false ]]; then
    echo "Set the GITHUB_TOKEN or TOKEN env variables."
    exit 1
fi

if [[ -z "$GITHUB_HOSTNAME" ]]; then
    GITHUB_HOSTNAME="github.com"
fi

main() {
    echo "Starting deploy..."

    echo "Building in $BUILD_DIR directory"
    cd "$BUILD_DIR"

    git config --global url."https://".insteadOf git://
    ## $GITHUB_SERVER_URL is set as a default environment variable in all workflows, default is https://github.com
    git config --global url."$GITHUB_SERVER_URL/".insteadOf "git@${GITHUB_HOSTNAME}":

    # needed or else we get 'doubious ...' error
    echo "Disable safe directory check"
    git config --global --add safe.directory '*'

    version=$(scraps --version)
    remote_repo="https://${GITHUB_ACTOR}:${GITHUB_TOKEN}@${GITHUB_HOSTNAME}/${TARGET_REPOSITORY}.git"
    remote_branch=$PAGES_BRANCH

    echo "Using $version"

    echo "Building"
    scraps build

    echo "Pushing artifacts to ${TARGET_REPOSITORY}:$remote_branch"

    cd "${OUT_DIR}"
    git init
    git config user.name "GitHub Actions"
    git config user.email "github-actions-bot@users.noreply.${GITHUB_HOSTNAME}"
    git add .

    git commit -m "Deploy ${TARGET_REPOSITORY} to ${TARGET_REPOSITORY}:$remote_branch"
    git push --force "${remote_repo}" master:"${remote_branch}"

    echo "Deploy complete"
}

main "$@"
