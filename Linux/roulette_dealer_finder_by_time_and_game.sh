
#!/bin/bash

# $1 is a four digit date (e.g. 0310)
# $2 corresponds to the casino game: BlackJack= B or b, Roulette= R or r, or Texas holdem = T or t
# $3 corresponds to time in the following format 08:00:00 PM/AM

# syntax ./roulette_dealer_finder_by_time_and_game2.sh $1 $2 '07:00:00 PM'

Aug_Game=$2

if [[ $2 = [Bb] ]] 
then
echo BlackJack
echo Date: $1
cat ~/Desktop/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis/$1_Dealer_schedule | awk -F" " '{print $1, $2, $3, $4}' | grep "$3" 


elif [[ $2 = [Rr] ]]
then
echo Roulette
echo Date: $1
cat ~/Desktop/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis/$1_Dealer_schedule | awk -F" " '{print $1, $2, $5, $6}' | grep "$3" 

elif [[ $2 = [Tt] ]] 
then
echo 'Texas holdem'
echo Date: $1
cat ~/Desktop/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis/$1_Dealer_schedule | awk -F" " '{print $1, $2, $7, $8}' | grep "$3" 


else
echo 'No Lucky Duck dealer found...better luck next time!'

fi





 


