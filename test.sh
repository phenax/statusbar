#!/usr/bin/env bash

fn() { echo 1; ~/scripts/notify.sh "Callelddd"; }

echo $$;

trap 'fn' 2;

while read line; do [[ "$line" == "q" ]] && exit 0 || echo $line; done;

