#!/bin/sh

# -----------------------------------------------------------------------------
# Installs the specified CLM file and restarts BBEdit if running
# -----------------------------------------------------------------------------

baseDir=`pwd`
installDir="${HOME}/Library/Application Support/BBEdit/Language Modules"
file=$1

cd ${baseDir}

if [[ -n "${file}" && "${file: -6}" == ".plist" ]]
then
    cp -f "${file}" "${installDir}"
    osascript -e "tell application \"BBEdit\" to quit"
    sleep 1
    osascript -e "tell application \"BBEdit\" to activate"
else
    echo "Skipping install, no valid file specified"
    echo "Usage: install.sh [file]"
fi

