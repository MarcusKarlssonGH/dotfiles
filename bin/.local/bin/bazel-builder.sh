#!/usr/bin/env bash

root=~/code/bazel-clangd/bazel-build-examples/cpp-tutorial/stage3

if [[ $# -eq 1 ]]; then
  command=$1
else
  command=run
fi

targets=mytargets.txt

if [[ $command == "update" ]]; then
  (cd $root; bazel query //...) > $targets
fi

target=$(cat $targets | fzf)
(cd $root; bazel $command $target)
