#!/bin/sh

set -e

INOTIFY_EVENTS_DEFAULT="create,delete,modify,move"
INOTIFY_OPTONS_DEFAULT='--monitor'

echo "inotify settings"
echo "================"
echo "  Volumes:          ${WATCH}"
echo "  Inotify_Events:   ${INOTIFY_EVENTS:=${INOTIFY_EVENTS_DEFAULT}}"
echo "  Inotify_Options:  ${INOTIFY_OPTONS:=${INOTIFY_OPTONS_DEFAULT}}"
echo "  Pattern:          ${PATTERN}"
echo

#
# Inotify part.
#
echo "[Starting inotifywait...]"
inotifywait -e ${INOTIFY_EVENTS} ${INOTIFY_OPTONS} "${WATCH}" | \
    grep -E "${PATTERN}" --line-buffered | \
    while read -r notifies;
    do
    	echo "$notifies"
    done
