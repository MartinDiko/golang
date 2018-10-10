#!/usr/bin/env bash

path=res/
shift
sha=0
update_sha() {
  sha=`ls -lR --time-style=full-iso $path | sha1sum`
}
update_sha
previous_sha=$sha
build() { 
  sleep 2s
  echo -en " building...\n\n"
  li package-plugin;
  li submit-plugin --force;
  echo -en "\n--> resumed watching."
}
compare() {
  update_sha
  if [[ $sha != $previous_sha ]] ; then
    echo -n "change detected,"
    build
    previous_sha=$sha
  else
    echo -n .
  fi
}
trap build SIGINT
trap exit SIGQUIT

echo -e  "--> Press Ctrl+C to force build, Alt+F4 to exit"
echo -en "--> watching \"$path\"."
while true; do
  compare
  sleep 1
done