#!/bin/sh -l

set -e

ssh-keyscan github.com > /root/.ssh/known_hosts

echo "${GITHUB_TOKEN}" >> /root/.ssh/subtree
chmod 0600 /root/.ssh/subtree

ARGS=""

if [ "$FORCE" == "true" ]; then
	ARGS="$ARGS -f"
fi

if [ "$SQUASH" == "true" ]; then
	ARGS="$ARGS --squash"
fi

if [ "$MESSAGE" != "" ]; then
	ARGS="$ARGS --message '${MESSAGE}'"
fi

git subtree -d -P "${PREFIX}" ${ACTION} ${ARGS} ${REPO} ${POSITION}
