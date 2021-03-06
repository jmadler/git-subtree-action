#!/bin/bash

set -exuo pipefail

git config --global --add safe.directory /github/workspace
git config --global url."https://api@github.com/".insteadOf "https://github.com/"
git config --global url."https://ssh@github.com/".insteadOf "ssh://git@github.com/"
git config --global url."https://git@github.com/".insteadOf "git@github.com:"
echo 'echo $INPUT_GITHUB_TOKEN' > /root/git-askpass
chmod +x /root/git-askpass
export GIT_ASKPASS=/root/git-askpass

ARGS=""

if [ "${INPUT_FORCE}" == "true" ]; then
	ARGS="$ARGS -f"
fi

if [ "${INPUT_SQUASH}" == "true" ]; then
	ARGS="$ARGS --squash"
fi

if [ "${INPUT_MESSAGE}" != "" ]; then
	ARGS="$ARGS --message ${INPUT_MESSAGE}"
fi

if [ "${INPUT_GIT_EMAIL}" != "" ]; then
    git config --global user.email "${INPUT_GIT_EMAIL}"
fi

if [ "${INPUT_GIT_NAME}" != "" ]; then
    git config --global user.name "${INPUT_GIT_NAME}"
fi

git subtree -d -P "${INPUT_PREFIX}" ${INPUT_ACTION} ${ARGS} "${INPUT_REPO}" "${INPUT_POSITION}"
