#! /bin/bash

export LANG=en_US.UTF-8

command="$@"

source ./Automation/env_var.sh

if [ -z ${XCODE_VERSION} ]; then
    source ./fastlane/xcode_version
fi


export DEVELOPER_DIR=""
GetXcodeDevelopDir() { 
    XCODE_PATHS_XML="xcode_paths.xml"
    system_profiler SPDeveloperToolsDataType -xml > $XCODE_PATHS_XML
    XCODE_PATH=`xmllint --xpath  "//*[text()='spdevtools_version']/following-sibling::string[starts-with(text(),'$XCODE_VERSION')]/../*[text()='spdevtools_path']/following-sibling::string[1]/text()" $XCODE_PATHS_XML | head -n 1`
    DEVELOPER_DIR="${XCODE_PATH}/Contents/Developer"
}


GetXcodeDevelopDir

if [ ! -d "${DEVELOPER_DIR}" ] 
then
    echo "Xcode version ${XCODE_VERSION} not found" 
    exit 1
fi

echo "Using xcode version ${XCODE_VERSION}"

echo "Executing  the following command: bundle $command"

eval "bundle _${BUNDLE_VERSION}_ $command"

