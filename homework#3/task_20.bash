#!/bin/bash

currentStep=1
plussSymbol="+"
guessed=()
allNumbers=()
while true; do
  regexFilter='^[0-9]+$'
  hiddenNumber=$((200 + $RANDOM % 10))
  echo Step: $currentStep
  read -p "Please enter the number from 200 to 209 (q - quite): " num
  if [[ $num == "q" ]]; then
    echo "Exit..."; exit 1
  elif ! [[ $num =~ $regexFilter ]] || (($num > 209)) || (($num < 200)); then
    echo "Incorrect input!"
    printf "\n"
    continue
  fi
  if (( $num == $hiddenNumber )); then
    correctNumber="$hiddenNumber ${pluss}"
    guessed[currentStep-1]=$correctNumber
    allNumbers[currentStep-1]=$correctNumber
    echo Right
  else
    allNumbers[currentStep-1]=$hiddenNumber
    echo Miss! My number: $hiddenNumber
  fi
  hit=$(( 100/${#allNumbers[*]}*${#guessed[*]} ))
  miss=$(( 100 - hit ))
  echo Hit: $hit%, Miss $miss%
  if (( ${#allNumbers[*]} <= 7 )); then
    echo Numbers: ${allNumbers[*]}
  else
    echo Numbers: ${allNumbers[-7]}, ${allNumbers[-6]}, ${allNumbers[-5]}, ${allNumbers[-4]}, ${allNumbers[-3]}, ${allNumbers[-2]}, ${allNumbers[-1]}
  fi
  printf "\n"
  currentStep=$((currentStep+1))
done
