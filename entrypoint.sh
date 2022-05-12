#!/bin/bash

set -exuo pipefail

ssh-keyscan github.com > /root/.ssh/known_hosts

echo "${INPUT_GITHUB_TOKEN}" >> /root/.ssh/id_github_token
chmod 0600 /root/.ssh/id_github_token

git config --global --add core.sshCommand "ssh -i ~/.ssh/id_github_token"
git config --global --add safe.directory /github/workspace

ARGS=""

if [ "${INPUT_FORCE}" == "true" ]; then
	ARGS="$ARGS -f"
fi

if [ "${INPUT_SQUASH}" == "true" ]; then
	ARGS="$ARGS --squash"
fi

if [ "${INPUT_MESSAGE}" != "" ]; then
	ARGS="$ARGS --message '${MESSAGE}'"
fi

git subtree -d -P "${INPUT_PREFIX}" ${INPUT_ACTION} ${INPUT_ARGS} ${INPUT_REPO} ${INPUT_POSITION}
