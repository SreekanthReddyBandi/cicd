#! /bin/bash

export LANG=en_US.UTF-8


"./run_bundle.sh" install --path="./gem"
"./run_bundle.sh" exec pod install --repo-update
