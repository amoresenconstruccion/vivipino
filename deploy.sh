#!/bin/bash
set -e

WORK_TREE="/home/u382815373/domains/vivipino.com/public_html"
GIT_DIR="$WORK_TREE/.git"

cd "$WORK_TREE"

if [ -d "$GIT_DIR" ]; then
  git --git-dir="$GIT_DIR" --work-tree="$WORK_TREE" fetch --all --prune
  git --git-dir="$GIT_DIR" --work-tree="$WORK_TREE" checkout -B main origin/main
  git --git-dir="$GIT_DIR" --work-tree="$WORK_TREE" reset --hard origin/main
  git --git-dir="$GIT_DIR" --work-tree="$WORK_TREE" clean -fd
else
  git clone --branch main --depth 1 https://github.com/amoresenconstruccion/vivipino.git "$WORK_TREE"
fi

echo "Deploy OK: $(date)"
