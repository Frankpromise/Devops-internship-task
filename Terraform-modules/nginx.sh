#!/bin/bash

read INP
  if [ $INP -eq 1 ]
  then
    if command -v nginx
    then
      systemctl status nginx
      back
    else
      error
      read INP
      if [ $INP == y ]
      then
        sudo yum install nginx
      else
        back
      fi
    fi
  fi