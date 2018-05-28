#!/bin/env bash
FILE="$1"
#echo "creating tmux session with name $NAME"
/usr/bin/tmux new-session -d "-s $FILE" && \
/usr/bin/tmux send-keys "./run4eva.sh $FILE" C-m && \
echo "reattatch: tmux a -s $FILE, or just tmux a"
