#!/usr/bin/env bash

languages=(greek latin babylonian aramaic cimmerian hyperborean tindalosian ophidian saurian lemurian atlantean runic)
alignments=(Lawful Chaotic Neutral)
classes=(Warrior Wizard Thief Cleric Elf Hobbit Dwarf)
classes=(${classes[*]} Champion Explorer Cultist Naturalist Warlock Cryptid Mutant)

# Generate Lawful Names
first_name=(Fred James Jennifer Sammy Janis Julio Pablo Jon Candace Eric Jaxon Joe Monte Aaron)
first_name=(${first_name[*]} Jon Ben Earl Vinton Evelin Myrtle Jimmy Mim Dahlia Sunny Mark Chris)
first_name=(${first_name[*]} Nancy Harold Chick Ed Edmund Frank Mike Spencer Greg David Gabe Dillard)
first_name=(${first_name[*]} Dave Harry Benjamin Eve Mi Francesca Edric Greg David Gabe Olive Gomer)

last_name=(Jameson Frederickson Wheeler Bartleby Cider Jamboree Finklestein Zinkie Cole Cooper)
last_name=(${last_name[*]} Jacobsen Shekelhund James Jones Evans Frankson Curran Coghlan Stwart)
last_name=(${last_name[*]} Nikelson Nickson Riley "O'Rourke" "O'Connor" Green Brown Absinthe Wagoner)
last_name=(${last_name[*]} Crickham Black Daniels Hermes Brachiomonte Klein Pyle Pyre Cairn Payne)

occupation=(Accountant Acrobat Detective Ambassador Architect Butler Artist Author Barber Bartender)
occupation=(${occupation[*]} Fixer Bookie Crimelord Boxer Wrestler Biologist Burglar Priest Clergy Clerk)
occupation=(${occupation[*]} Pharmacist Communist Radical Executive Columnist Cook Deacon Elder Diver)
occupation=(${occupation[*]} Operator Dilettante DJ Drifter Editor Official Entertainer Dentist)
occupation=(${occupation[*]} Explorer Farmer Farmhand Federal Fence Fireman Surgeon Gambler Punk)
occupation=(${occupation[*]} Forger Counterfeiter Forester Psychologist Gangster Gardener "Grave digger")
occupation=(${occupation[*]} Hacker Goon Hitman Hobo Hooker Journalist Judge Lawyer Librarian)
occupation=(${occupation[*]} Loanshark Lumberjack Manager Coach Technician Mercenary Miner Missionary)
occupation=(${occupation[*]} Curator Musician Nurse Rabbi Driver Occultist Painter Sculptor)
occupation=(${occupation[*]} Parapsychologist Photographer Photojournalist Physician Pickpocket Pilot)
occupation=(${occupation[*]} Surgeon Police Minister Brewer Attorney Preacher Professor Teacher)
occupation=(${occupation[*]} Programmer Rancher Cowboy Reporter Researcher Sailor Salesman Secretary)
occupation=(${occupation[*]} Lawyer Spy Student Intern Smuggler Soldier Marine Actor Stagehand )
occupation=(${occupation[*]} Broker Criminal Surveyor Swimmer Diver Agent Tribal Undertaker Unionist)
occupation=(${occupation[*]} Writer Zookeeper Mechanic Doctor Archaeologist Scientist Astrophysicist)
occupation=(${occupation[*]} Astronomer Historian Mystic Magician Stuntman Bodyguard Vagrant)

# Generate Chaos names
consonants=(b c d f g h j k l m n p q r s t v w x y z)
uppcase_consonants=(B C D F G H J K L M N P Q R S T V W X Y X)

print_vowel() {
  vowels=(a e i o u)
  printf ${vowels[$(($RANDOM%${#vowels[*]}))]}
}

print_uppcase_consonant() {
  uppcase_consonants=(B C D F G H J K L M N P Q R S T V W X Y X)
  printf ${uppcase_consonants[$(($RANDOM%${#uppcase_consonants[*]}))]}
}
print_consonant() {
  consonants=(b c d f g h j k l m n p q r s t v w x y z)
  printf ${consonants[$(($RANDOM%${#consonants[*]}))]}
}

print_optional() {
  optional=$(( RANDOM % 3 ))
  if [ ${optional} = 0 ]; then
    print_consonant
    print_vowel
  elif [ ${optional} = 1 ]; then
    print_vowel
    print_consonant
  elif [ ${optional} = 2 ]; then
    print_consonant
    print_vowel
    print_consonant
  else
    print_consonant
  fi
}

print_section() {
  sections=(oi ae ai ay yo io li il ta da do di ri mi ni)
}

chaos_name() {
  print_uppcase_consonant

  if [ $(( RANDOM % 2 )) -lt 1 ]; then
    print_vowel
    print_vowel
  else
    print_vowel
  fi

  print_consonant

  if [ $(( RANDOM % 3 )) -lt 2 ]; then
    print_optional
  fi

  if [ $(( RANDOM % 3 )) -lt 2 ]; then
    printf "\'"
    print_optional
  fi

}

# functions for generating stats
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

roll_equipment() {
  trinkets=("some pocket fluff" "a grime covered key" "chewing gum" "a box of matches" "some string tied to a metal washer"
            "a few canadian coins" "a pebble" "a phillips screwdriver" "an empty water bottle"
            "a quartz crystal" "an old worn coin" "a kazoo" "a expired winning lottery ticket" "half a bag of M&Ms")
  change_types=("some spare coins" "ten bucks" "a few bucks" "a twenty" "a hundred bucks" "a few hundred bucks")
  weapons=("hunting knife" "kitchen knife" "combat knife" "broken bottle" "makeshift shiv" "brick" "rock" "chair leg" "table leg")
  weapons=(${weapons[*]} ".38 special" ".22 rifle" "shotgun" "can of bear repellent" "tazer" "piece of rebar" "crowbar" "wrench")
  trinket=${trinkets[$(($RANDOM%${#trinkets[*]}))]}
  change=${change_types[$(($RANDOM%${#change_types[*]}))]}
  weapon=${weapons[$(($RANDOM%${#weapons[*]}))]}
  printf "a ${weapon}, ${change}, and ${trinket}"
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
          "known languages")
          #"quick: +$(( $(echo ${luck_mod} | sed s/+//g | sed s/-//g) * 5 )) to speed")
  random_augur=$(($RANDOM%${#augurs[*]}))
  printf "${luck_mod} ${augurs[${random_augur}]}"
}


# main

# generate variable values
CLASS=${classes[$(($RANDOM%${#classes[*]}))]}
OCCUPATION=${occupation[$(($RANDOM%${#occupation[*]}))]}
STR=$(( 4 + RANDOM % 15 ))
AGI=$(( 4 + RANDOM % 15 ))
STA=$(( 4 + RANDOM % 15 ))
PER=$(( 4 + RANDOM % 15 ))
INT=$(( 4 + RANDOM % 15 ))
LCK=$(( 4 + RANDOM % 15 ))
AC=$(roll_armor_class)
HP=$(( 1 + RANDOM % 4 ))

# generate alignment // chaos champion hack
if [ ${CLASS} == Cultist ] || [ ${CLASS} == Champion ]; then
  ALIGNMENT=Chaos
else
  ALIGNMENT=${alignments[$(($RANDOM%${#alignments[*]}))]}
fi

# generate names by alignment
if [ ${ALIGNMENT} == Chaos ] || [ ${ALIGNMENT} == Chaotic ]; then
  NAME=$(chaos_name)
else
  NAME=$(echo ${first_name[$(($RANDOM%${#first_name[*]}))]} ${last_name[$(($RANDOM%${#last_name[*]}))]})
fi

# display data
echo ${NAME}, ${ALIGNMENT} ${CLASS} ${OCCUPATION}
echo
printf "STR ${STR}\t$(get_mod ${STR})  HP ${HP}\n"
printf "AGI ${AGI}\t$(get_mod ${AGI})  AC ${AC}\n"
printf "STA ${STA}\t$(get_mod ${STA})\n"
printf "PER ${PER}\t$(get_mod ${PER})  Fort $(get_mod ${STA})\n"
printf "INT ${INT}\t$(get_mod ${INT})  Ref  $(get_mod ${AGI})\n"
printf "LCK ${LCK}\t$(get_mod ${LCK})  Will $(get_mod ${PER})\n"
echo
echo Augur: $(roll_augur $(get_mod ${LCK}))
echo Languages: Common, ${languages[$(($RANDOM%${#languages[*]}))]} # $(roll_languages)
echo Equipment: $(roll_equipment)
