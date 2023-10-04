#! /bin/bash

export LANG=en_US.UTF-8


"./Automation/run_bundle.sh" install --path="./gem"
"./Automation/run_bundle.sh" exec pod install --repo-update
