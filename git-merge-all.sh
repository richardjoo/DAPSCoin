#!/bin/bash

git checkout qa
git merge dev
git push
git checkout master
git merge qa
git push
git checkout dev
