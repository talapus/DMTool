#!/usr/bin/env bash

get_vowel() {
  vowels=(a e i o u)
  random_vowel=$(($RANDOM%${#vowels[*]}))
  printf ${vowels[${random_vowel}]}  # ${vowels[$(($RANDOM%${#vowels[*]}))]} doesn't work
}

get_consonant() {
  consonants=(b c d f g h j k l m n p p r s t v w x y z)
  random_consonant=$(($RANDOM%${#consonants[*]}))
  printf ${consonants[${random_consonant}]}
}

get_optional() {
  optional=$(( RANDOM % 3 ))
  if [ optional = 0 ]; then
    get_consonant
    get_vowel
  elif [ optional = 1 ]; then
    get_vowel
    get_consonant
  elif [ optional = 2 ]; then
    get_consonant
    get_vowel
    get_consonant
  else
    get_consonant
  fi
}

get_section() {
  sections=(oi ae ai ay yo io li il ta da do di ri mi ni )
}


get_name() {
  get_consonant

  if [ $(( RANDOM % 2 )) -lt 1 ]; then
    get_vowel
    get_vowel
  else
    get_vowel
  fi

  get_consonant

  if [ $(( RANDOM % 3 )) -lt 2 ]; then
    get_optional
  fi
}

get_class() {
  classes=(warrior wizard thief demigod elf hobbit dwarf alchemist warlock elemental shapeshifter beastman 'chaos champion' engineer adventurer)
  random_class=$(($RANDOM%${#classes[*]}))
  printf ${classes[${random_class}]}
}

get_mod() {
  stat=${1-0}
  if [ ${stat} -eq 3 ]; then
    printf "˗3"
  elif [ ${stat} -gt 3 ] && [ ${stat} -lt 6 ]; then
    printf "˗2"
  elif [ ${stat} -gt 5 ] && [ ${stat} -lt 9 ]; then
    printf "˗1"
  elif [ ${stat} -gt 8 ] && [ ${stat} -lt 13 ]; then
    printf '+0'
  elif [ ${stat} -gt 12 ] && [ ${stat} -lt 16 ]; then
    printf '+1'
  elif [ ${stat} -gt 15 ] && [ ${stat} -lt 18 ]; then
    printf '+2'
  elif [ ${stat} -eq 18 ]; then
    printf '+3'
  fi
}

roll_armor_class() {  # 10 + agi bonus
  stat=$(( 3 + RANDOM % 16 ))
  if [ ${stat} -eq 3 ]; then
    printf '7'
  elif [ ${stat} -gt 3 ] && [ ${stat} -lt 6 ]; then
    printf '8'
  elif [ ${stat} -gt 5 ] && [ ${stat} -lt 9 ]; then
    printf '9'
  elif [ ${stat} -gt 8 ] && [ ${stat} -lt 13 ]; then
    printf '10'
  elif [ ${stat} -gt 12 ] && [ ${stat} -lt 16 ]; then
    printf '11'
  elif [ ${stat} -gt 15 ] && [ ${stat} -lt 18 ]; then
    printf '12'
  elif [ ${stat} -eq 18 ]; then
    printf '13'
  fi
}

get_languages() {
  number=${1-1}  # one language, or more if specified
  language=(common greek latin babylonian aramaic cimmerian hyperborean tindalosian ophidian saurian)

  for i in `seq ${number}`; do
    printf " ${language[${i}]}"
  done
}

get_equipment() {
  printf "some picket fluff"
}


get_augur() {
  luck_mod=${1-0}  # 0 if nothing provided
  augurs=("to attack rolls"
          "to melee attack rolls" 
          "to missile fire attack rolls" 
          "to unarmed attack rolls" 
          "to mounted attack rolls" 
          "to damage rolls"
          "to melee damage rolls" 
          "to missile fire damage rolls" 
          "to attack and damage rolls for 0-level trained weapon" 
          "to skill checks (including thief skills)" 
          "to find/disable traps" 
          "to find secret doors" 
          "to mutation checks" 
          "to mutation damage rolls" 
          "to AI recognition rolls" 
          "to healing rolls" 
          "to saving throws" 
          "to escape traps" 
          "to saving throws against poison" 
          "to reflex saving throws" 
          "to fortitude saving throws" 
          "to willpower saving throws" 
          "to armor class" 
          "to initiative" 
          "to hit points (applies at each level)" 
          "to critical hit tables" 
          "to defect rolls" 
          "to fumbles" 
          "known languages" 
          "to speed (each +1 = +5’ speed)")
  random_augur=$(($RANDOM%${#augurs[*]}))
  printf "${luck_mod} ${augurs[${random_augur}]}"
}

# main

NAME=$(get_name)
CLASS=$(get_class)
STR=$(( 4 + RANDOM % 15 ))
AGI=$(( 4 + RANDOM % 15 ))
STA=$(( 4 + RANDOM % 15 ))
PER=$(( 4 + RANDOM % 15 ))
INT=$(( 4 + RANDOM % 15 ))
LCK=$(( 4 + RANDOM % 15 ))
AC=$(roll_armor_class)
HP=$(( 1 + RANDOM % 4 ))

echo ${NAME} the ${CLASS}
echo
echo AC ${AC} HP ${HP}
echo STR ${STR} $(get_mod ${STR})
echo AGI ${AGI} $(get_mod ${AGI})
echo STA ${STA} $(get_mod ${STA})
echo PER ${PER} $(get_mod ${PER})
echo INT ${INT} $(get_mod ${INT})
echo LCK ${LCK} $(get_mod ${LCK})
echo
echo $(get_augur $(get_mod ${LCK}))
echo Languages $(get_languages)
echo equipment $(get_equipment)
