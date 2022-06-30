#!/usr/bin/env bash
# -*- coding:utf-8 -*-

# Author:       Casey Sparks
# Date:         June 14, 2022
# Description:  Puts all git branches and remotes at current hostname HEAD.

git switch ${HOSTNAME} &&
    git add . &&
    git commit &&
    git push

for BRANCH in $(git branch); do
    git switch ${BRANCH} &&
        git merge ${HOSTNAME} &&
        git push
done

git switch ${HOSTNAME}
