#!/usr/bin/env bash

TTY="$1"

IDLE=20
CHECK=2
RUNNING=0

# exit if no tty was passed
[ -z "$TTY" ] && exit 1

run_native() {
    cmatrix -r -s -u 10 < "$TTY" > "$TTY" 2>&1
}

run_docker() {
    docker run --rm -it \
        -v "$TTY":"$TTY" \
        leonardoszenon/cmatrix:latest \
        < "$TTY" > "$TTY" 2>&1
}

run_screensaver() {

    # native cmatrix
    if command -v cmatrix >/dev/null 2>&1; then
        run_native
    fi

    # fallback docker
    if command -v docker >/dev/null 2>&1; then
        if run_docker; then
            return
        fi
    fi


}

while true; do
    LAST=$(stat -c %X "$TTY" 2>/dev/null) || {
        sleep "$CHECK"
        continue
    }

    NOW=$(date +%s)
    DIFF=$((NOW - LAST))

    if [ "$DIFF" -ge "$IDLE" ] && [ "$RUNNING" -eq 0 ]; then
        RUNNING=1

        run_screensaver

        # restore terminal after cmatrix/docker exits
#        reset < "$TTY" > "$TTY" 2>&1

        RUNNING=0
    fi

    sleep "$CHECK"
done