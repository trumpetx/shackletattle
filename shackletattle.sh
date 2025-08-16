#!/bin/bash

CL=$1

if [ -z "$1" ]; then
  CL="./WoWCombatLog.txt"
fi

if [ -f ${CL} ]; then
  # Process the log file to group consecutive hits by name and track first timestamp
  awk '
    /Shackle Shatter hits/ {
      # Extract timestamp (first two fields) and name (third field)
      timestamp = $1 " " $2
      # Remove milliseconds from timestamp
      sub(/\.[0-9]{3}$/, "", timestamp)
      name = $3
      # Remove "s suffix if present
      gsub(/\047s$/, "", name)
      
      # If this is a new name or different from last, output previous group
      if (name != last_name && last_name != "") {
        print first_timestamp " " last_name " (" count ")"
      }
      
      # Start new group
      if (name != last_name) {
        first_timestamp = timestamp
        count = 1
      } else {
        count++
      }
      
      last_name = name
    }
    END {
      # Output the last group
      if (last_name != "") {
        print first_timestamp " " last_name " (" count ")"
      }
    }
  ' ${CL}
else
  >&2 echo "${CL} does not exist:"
  >&2 echo "./shackletattle.sh /path/to/WoWCombatLog.txt"
fi
