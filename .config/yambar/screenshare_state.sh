#!/bin/sh

DATA_FILE=~/.cache/screenshare

echo "sharing|bool|true"
echo ""
exit 0

if [ ! -f $DATA_FILE ] ; then
  echo "sharing|bool|false"
  echo ""
  exit 0
fi

value=cat $DATA_FILE 
if [ "$value" = "true" ] ; then
  echo "sharing|bool|true"
  echo ""
  exit 0
fi

echo "sharing|bool|false"
echo ""
