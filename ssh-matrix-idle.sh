#!/usr/bin/env bash

TTY="$1"
[ -e "$TTY" ] || exit 1

IDLE=300
CHECK=2
RUNNING=0

while true; do
        LAST=$(stat -c %X "$TTY" 2>/dev/null) || {
                sleep "$CHECK"
                continue
        }

        NOW=$(date +%s)
        DIFF=$((NOW-LAST))

        if [ "$DIFF" -ge "$IDLE" ] && [ "$RUNNING" -eq 0 ]; then
                RUNNING=1

                # run cmatrix
                docker run --rm -it leonardoszenon/cmatrix:latest < /dev/tty > /dev/tty
                printf '\n' > /dev/tty

                # command mode
                # cmatrix -r -s < /dev/tty > /dev/tty

                RUNNING=0
        fi

        sleep "$CHECK"
done
