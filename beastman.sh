#!/usr/bin/env bash

roll_mod() {
  stat=$(( 3 + RANDOM % 16 ))
  if [ ${stat} -eq 3 ]; then
    printf "+0" #-3  TODO: printf: -0: invalid option
  elif [ ${stat} -gt 3 ] && [ ${stat} -lt 6 ]; then
    printf "+0" #-2
  elif [ ${stat} -gt 5 ] && [ ${stat} -lt 9 ]; then
    printf "+0" #-1
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

roll_mutation() {   # determines the beastman's chaos-granted mutation
  heads=('an ape' 'a bear' 'a ram' 'a rat' 'a tiger' 'a wolf' 'a vulture' 'a raven'
          'an owl' 'a frog' 'an octopus' 'an eel' 'a salamander' 'a snake' 'a lizard'
          'an elephant' 'a bull' 'a horse' 'a rhino' 'a fly' 'a spider' 'a cockroach'
          'an ant' 'an eagle' 'a cat' 'a fish' 'a shark' 'a praying mantis' 'a dolphin'
          'a peacock' 'a beaver' 'a prawn' 'an earthworm' 'a squirrel' 'an anteater'
          'a lamprey' 'a jellyfish' 'a giraffe' 'a zebra' 'an antelope' 'am elk')
  random_head=$(( RANDOM % ${#heads[*]} ))
  head=${heads[${random_head}]}
  mutations=("thick, bristly fur and the head of ${head}"
              "hunched, furred back, with a second, diminutive head"
              "dense coat of feathers and the head of ${head}"
              "receding lips that curl back to reveal saber-like fangs, and the slit pupils of a cat."
              "mottled, clammy flesh and the head of ${head}"
              "curling ram’s horns and bulbous, oversized eyes."
              "oversized, hanging jowls that drip black ichor and tiny pinholes for eyes."
              "iridescent scales and the head of ${head}"
              "face devoid of mandible form, leaving a flapping, wet mess in the place of the mouth and nose."
              "body that weeps maggots, larvae, and flies from its open maw, ears, and eyes."
              "thick, leathery skin and the head of ${head}"
              "dark, shiny skin and the head of ${head}"
              "long unhealing sores with black hairs growing from them and a head of ${head}"
              "$(( 2 + RANDOM % 3)) arms and a head of ${head}"
              #"two heads: ${head} and ${head}"  # ant and ant
              "translucent skin and glowing bones"
              "glowing eyes and an everburning aura"
              "froglike skin and the head of ${head}"
              "snakelike arms and the head of ${head}"
              "a serpentine lower body and head of ${head}"
              "no head and the face of ${head} in the middle of their chest"
              "$(( 3 + RANDOM % 2 )) arms and two heads"
              "batlike face, arms, and hands"
              "a sluglike look"
              "an insectoid look"
              "a reptilian look")
  random_mutation=$(( RANDOM % ${#mutations[*]} ))
  mutation=${mutations[${random_mutation}]}
  printf "${mutation}"
}

roll_weapon() {  # assigns melee or ranged weapon
  weapon_type=$(( RANDOM % 4 ))
  if [ ${weapon_type} -eq 0 ]; then
    weapons=(club hammer dagger crowbar trowel)   # d4 melee weapons
    random_weapon=$(( RANDOM % ${#weapons[*]} ))  # random d4 melee weapon
    weapon_mod=$(roll_mod)
    weapon=${weapons[${random_weapon}]}
    printf "${weapon} ${weapon_mod} melee (1d4)"
  elif [ ${weapon_type} -eq 1 ]; then  # 1d6 melee
    weapons=(spear shortsword awl staff shovel mace)
    random_weapon=$(( RANDOM % ${#weapons[*]} ))
    weapon_mod=$(roll_mod)
    weapon=${weapons[${random_weapon}]}
    printf "${weapon} ${weapon_mod} melee (1d6)"
  elif [ ${weapon_type} -eq 2 ]; then  # 1d4 ranged
    weapons=(sling dart)
    random_weapon=$(( RANDOM % ${#weapons[*]} ))
    weapon_mod=$(roll_mod)
    weapon=${weapons[${random_weapon}]}
    printf "${weapon} ${weapon_mod} ranged (1d4)"
  elif [ ${weapon_type} -eq 3 ]; then  # longsword
    weapon_mod=$(roll_mod)
    weapon=longsword
    printf "${weapon} ${weapon_mod} melee (1d8)"
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

roll_health() {
  printf "$(( 1 + RANDOM % 3 ))"
}

# main
printf "$(Name), a beastman with $(roll_mutation) \n"
printf "Init $(roll_mod), Atk $(roll_weapon); AC $(roll_armor_class); hp $(roll_health); MV 30'; Act 1d20; "
printf "SV Fort $(roll_mod), Ref $(roll_mod), Will $(roll_mod); AL C. \n"
