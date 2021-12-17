#!/bin/bash

# Roulette Dealer Loss Investigation Script - March 15th
cat $1 | awk -F" " '{print $1, $2, $5, $6}' | grep '0[5,8]:00:00 AM\|02:00:00 PM'
