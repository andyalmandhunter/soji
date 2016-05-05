#!/usr/bin/env bash

todays_data_file_path="$SOJI_DIR/events-$(date +%Y-%m-%d).csv"
if [ -e $todays_data_file_path ]; then
  task=`cat $todays_data_file_path | egrep "^(start|break|lunch)" | tail -1 |awk -F, '{print $2}'`
  start_time=`cat $todays_data_file_path | egrep "^(start|break|lunch)" | tail -1 | awk -F, '{print $3}'`
  seconds=`expr $(date +'%s') - $start_time`
  minutes=`expr $seconds / 60`
  echo "$task -- $minutes min"
fi
