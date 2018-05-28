#!/bin/env bash
CMD="$1"
until /bin/bash "$CMD"; do
  echo "crashed, restarting in 5sec" >&2
  sleep 5
done
