#!/usr/bin/env bash

git \
  clone \
  https://github.com/dmitriysafronov/ansible_role-template.git \
  .update

LATEST_TAG="$(git -C .update tag | grep -e '^v' | sort -V | tail -n 1)"

git -C .update -c advice.detachedHead=false checkout ${LATEST_TAG}

if [[ -s .update/update.list ]]; then
  rsync -av \
    --include-from=.update/update.list \
    --include=update.list \
    --include=update.sh \
    --exclude=* \
    --delete-after \
    .update/ \
    ./
fi

rm -rf .update/
