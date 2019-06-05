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

roll_name() {
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

roll_character_class() {
  classes=(warrior wizard thief cleric elf hobbit dwarf naturalist warlock shapeshifter beastman champion engineer explorer cultist)

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

roll_languages() {
  number=${1-0} # one language, or more if specified
  language=(greek latin babylonian aramaic cimmerian hyperborean tindalosian ophidian saurian lemurian atlantean runic)

  for i in `seq 0 ${number}`; do
    random_language=$(( RANDOM % ${#language[*]} ))
    printf " ${language[${random_language}]}"
  done
}

roll_equipment() {
  trinkets=("pocket fluff" "old keys" "chewing gum" "candy wrappers")
  change_types=("some spare coins" "ten bucks" "a few bucks" "a twenty")
  weapons=("hunting knife" "kitchen knife" "combat knife" "broke bottle" "makeshift shiv" brick rock "chair leg" "table leg")
  random_trinket=$(($RANDOM%${#trinkets[*]}))
  random_change=$(($RANDOM%${#change_types[*]}))
  random_weapon=$(($RANDOM%${#weapons[*]}))
  trinket=${trinkets[${random_trinket}]}
  change=${change_types[${random_change}]}
  weapon=${weapons[${random_weapon}]}
  printf "a ${weapon}, ${change}, and some ${trinket}"
}

roll_augur() {
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

roll_alignment() {
  alignments=(lawful chaotic neutral)
  random_alignment=$(( RANDOM % ${#alignments[*]} ))
  printf " ${alignments[${random_alignment}]}"
}

# main

NAME=$(roll_name)
CLASS=$(roll_character_class)
ALIGNMENT=$(roll_alignment)
if [ ${CLASS} == cultist ] || [ ${CLASS} == champion ]; then
  ALIGNMENT=chaos  # "chaos champion" hack
fi

STR=$(( 4 + RANDOM % 15 ))
AGI=$(( 4 + RANDOM % 15 ))
STA=$(( 4 + RANDOM % 15 ))
PER=$(( 4 + RANDOM % 15 ))
INT=$(( 4 + RANDOM % 15 ))
LCK=$(( 4 + RANDOM % 15 ))
AC=$(roll_armor_class)
HP=$(( 1 + RANDOM % 4 ))

echo ${NAME}, ${ALIGNMENT} ${CLASS}
echo
printf "STR ${STR}\t$(get_mod ${STR})\tHP ${HP}\n"
printf "AGI ${AGI}\t$(get_mod ${AGI})\tAC ${AC}\n"
printf "STA ${STA}\t$(get_mod ${STA})\n"
printf "PER ${PER}\t$(get_mod ${PER})\tFort $(get_mod ${STA})\n"
printf "INT ${INT}\t$(get_mod ${INT})\tRef  $(get_mod ${AGI})\n"
printf "LCK ${LCK}\t$(get_mod ${LCK})\tWill $(get_mod ${PER})\n"
echo
echo Augur: $(roll_augur $(get_mod ${LCK}))
echo Languages: Common, $(roll_languages)
echo Equipment: $(roll_equipment)
