#!/bin/bash
kill_pid() {
  pid=$1
  timeout=25
  countdown=$(( timeout * 10 ))

  if [ -e "/proc/$pid" ]; then
    echo "Killing $pidfile: $pid "
    kill "$pid"
    while [ -e "/proc/$pid" ]; do
      sleep 0.1
      [ "$countdown" != '0' ] && [ $(( countdown % 10 )) = '0' ] && echo -n .
      if [ $timeout -gt 0 ]; then
        if [ $countdown -eq 0 ]; then
          echo -ne "\nKill timed out, using kill -9 on $pid... "
          kill -9 "$pid"
          sleep 0.5
          break
        else
          countdown=$(( countdown - 1 ))
        fi
      fi
    done
    if [ -e "/proc/$pid" ]; then
      echo "Timed Out"
    else
      echo "Stopped"
    fi
  else
    echo "Process $pid is not running"
    echo "Attempting to kill pid anyway..."
    kill "$pid"
  fi
}

kill_pidfile() {
  pidfile=$1

  if [ -f "$pidfile" ]; then
    pid=$(head -1 "$pidfile")
    if [ -z "$pid" ]; then
      echo "Unable to get pid from $pidfile"
      exit 1
    fi

    kill_pid "$pid"

    rm -f "$pidfile"
  else
    echo "Pidfile $pidfile doesn't exist"
  fi
}