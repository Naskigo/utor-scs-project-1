#!/bin/bash

# $1 is a four digit date (e.g. 0310)
# $2 corresponds to time in the following format '08:00:00 PM/AM'

cat $1_Dealer_schedule | awk -F" " '{print $1, $2, $5, $6}'| grep "$2"

 


