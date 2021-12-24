#!/bin/bash

# TODO: assert if STEAMCMD_USER is set to "anonymous"

if [ -z $STEAMCMD_USER ]
then
  echo "No user set in STEAMCMD_USER"
  echo "We will continue as best we can with anonymous user"
  export STEAMCMD_USER=anonymous
  export STEAMCMD_PASSWORD=""
fi

if [[ $STEAMCMD_USER == "anonymous" ]]
then
  expect ./anon.exp
else
  expect ./login.exp $STEAMCMD_PASSWORD
fi
