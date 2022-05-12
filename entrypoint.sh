#!/bin/sh -l

set -e

ssh-keyscan github.com > /root/.ssh/known_hosts

echo "${INPUT_GITHUB_TOKEN}" >> /root/.ssh/subtree
chmod 0600 /root/.ssh/subtree

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
