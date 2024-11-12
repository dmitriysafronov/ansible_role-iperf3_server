#!/usr/bin/env bash

git \
  clone \
  https://github.com/dmitriysafronov/ansible_role-template.git \
  .update

if [[ -s .update/update.list ]]; then
  rsync -av \
    --include-from=.update/update.list \
    --exclude=* \
    --delete-after \
    .update/ \
    ./
fi

rm -rf .update/
