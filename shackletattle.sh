#!/bin/bash

CL=$1

if [ -z "$1" ]; then
  CL="./WoWCombatLog.txt"
fi

if [ -f ${CL} ]; then
  grep "Shackle Shatter hits" ${CL} | awk '{print $3}' | uniq | rev | cut -c3- | rev
else
  >&2 echo "${CL} does not exist:"
  >&2 echo "./shackletattle.sh /path/to/WoWCombatLog.txt"
fi
