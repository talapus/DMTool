# glyph=("𓏈" "𓏇" "𓏞" "𓏟" "𓏀" "𓎞" "𓎓" "𓎁" "𓎂" "𓍝" "𓍚" "𓌾" "𓋣" "𓋦" "𓋬" "𓋧" "𓋍" "𓋌" "𓋎" "𓋏" "𓋈" "𓋇" "𓊿" "𓊽" "𓊲" "𓊣" "𓊢" "𓊯" "𓊂" "𓊁" "𓉹" "𓉦" "𓉥" "𓉪" "𓉭" "𓉠" "𓇭" "𓇵" "𓇶" "𓇸" "𓇘" "𓆷" "𓆦" "𓆣" "𓆨" "𓆧" "𓆫" "𓆲" "𓆱" "𓆰" "𓆐" "𓆏" "𓆌" "𓆉" "𓆈" "𓄸" "𓂏" "𓂍" "𓆟" "𓆚" "𓆙" "𓅫" "𓇊" "𓇣" "𓇬" "𓌝" "𓌟" "𓎣" "𓎴" "𓏓" "𓎜" "𓌡" "𓋩" "𓋫" "𓋐" "𓊡" "𓊚" "𓊗" "𓊖" "𓊕" "𓇷" "𓇳") #"⅌" "℥" "⅊" "⅀" "℻" "№" "℉" "℃" "℈" "℡" "℩" "ℵ" "ℶ" "ℷ" "ℸ" "Ω" "℧")
first_name=("Fred" "James" "Jennifer" "Sammy" "Janis" "Julio" "Pablo" "Jon" "Shin" "Maka" "Bin" "Jaxon")
first_name=(${first_name[*]} "Jon" "Ben" "Earl" "Vinton" "Evelin" "Myrtle")
last_name=("Jameson" "Frederickson" "Wheeler" "Bartleby" "Cider" "Jamboree" "Finklestein")
last_name=(${last_name[*]} "Jacobsen" "Shekelhund" "James" "Jones" "Evans" "Frankson")
last_name=(${last_name[*]} "Nikelson" "Nickson" "Riley" "O'Rourke" "Backus" "Green" "Brown")

occupation=("Accountant" "Acrobat" "Detective" "Ambassador" "Architect" "Butler")
occupation=(${occupation[*]} "Artist" "Author" "Barber" "Bartender" "Fixer")
occupation=(${occupation[*]} "Bookie" "Boss" "Boxer" "Wrestler" "Biologist")
occupation=(${occupation[*]} "Burglar" "Priest" "Clergy" "Clerk" "Pharmacist")
occupation=(${occupation[*]} "Communist" "Radical" "Executive" "Columnist" "Cook")
occupation=(${occupation[*]} "Deacon" "Elder" "Diver" "Dentist" "Operator")
occupation=(${occupation[*]} "Dilettante" "DJ" "Drifter" "Editor" "Official")
occupation=(${occupation[*]} "Entertainer" "Explorer" "Farmer" "Farmhand" "Federal")
occupation=(${occupation[*]} "Fence" "Fireman" "Surgeon" "Gambler" "Punk")
occupation=(${occupation[*]} "Forger" "Counterfeiter" "Forester" "Psychologist")
occupation=(${occupation[*]} "Gangster" "Gardener" "Gravedigger" "Hacker")
occupation=(${occupation[*]} "Goon" "Hitman" "Hobo" "Hooker" "Journalist" "Judge")
occupation=(${occupation[*]} "Lawyer" "Librarian" "Loanshark" "Lumberjack" "Manager")
occupation=(${occupation[*]} "Coach" "Technician" "Mercenary" "Miner" "Missionary")
occupation=(${occupation[*]} "Curator" "Musician" "Nurse" "Rabbi" "Driver")
occupation=(${occupation[*]} "Occultist" "Painter" "Sculptor" "Parapsychologist")
occupation=(${occupation[*]} "Photographer" "Photojournalist" "Physician" "Pickpocket")
occupation=(${occupation[*]} "Pilot" "Surgeon" "Police" "Minister" "Brewer")
occupation=(${occupation[*]} "Attorney" "Preacher" "Professor" "Teacher" "Programmer")
occupation=(${occupation[*]} "Rancher" "Cowboy" "Reporter" "Researcher" "Sailor")
occupation=(${occupation[*]} "Salesman" "Secretary" "Lawyer" "Spy" "Student" "Intern")
occupation=(${occupation[*]} "Smuggler" "Soldier" "Marine" "Actor" "Stagehand" "Broker")
occupation=(${occupation[*]} "Criminal" "Surveyor" "Swimmer" "Diver" "Agent" "Tribal")
occupation=(${occupation[*]} "Undertaker" "Unionist" "Writer" "Zookeeper")
occupation=(${occupation[*]} "Mechanic" "Doctor" "Archaeologist" "Scientist")
occupation=(${occupation[*]} "Astrophysicist" "Astronomer" "Historian" "Mystic")
occupation=(${occupation[*]} "Magician" "Stuntman" "Bodyguard" "Vagrant")

trait=("distractable" "uninhibited" "addict" "bully" "lawful" "roguish" "driven" "ugly" "poor hygeine")

flaw=("bad leg" "vertigo" "coulrophobia" "arachnophobia" "agoraphobia")
flaw=(${flaw[*]} "acrophobia" "astraphobia" "autophobia" "aquaphobia" "algophobia")
flaw=(${flaw[*]} "aerophobia" "carcinophobia" "chemophobia" "amnesia" "chronic pain")
flaw=(${flaw[*]} "hallicinations" "headaches")

alignment=("Hero" "" "Cultist")



# functions

function bonus {
  if [ $1 -lt 4 ]; then
    echo '-3';
  elif [ $1 -lt 5 ]; then
    echo '-2';
  elif [ $1 -lt 9 ]; then
    echo '-1';
  elif [ $1 -lt 13 ]; then
    echo '0';
  elif [ $1 -lt 16 ]; then
    echo '+1';
  elif [ $1 -lt 17 ]; then
    echo '+2';
  elif [ $1 -lt 19 ]; then
    echo '+3';
  fi;
}

if [ ${#1} -eq 0 ]; then
  name=$(echo ${first_name[$(($RANDOM%${#first_name[*]}))]} ${last_name[$(($RANDOM%${#last_name[*]}))]})
else
  name=$1
fi

STR=$(($RANDOM%15+4))
CON=$(($RANDOM%15+4))
INT=$(($RANDOM%15+4))
PER=$(($RANDOM%15+4))
LCK=$(($RANDOM%15+4))
POW=$(($RANDOM%15+4))
MYTHOS=$(($RANDOM%4+1))
SANITY=$(($RANDOM%10+90-${MYTHOS}))

echo ${name}, ${alignment[$(($RANDOM%${#alignment[*]}))]} ${occupation[$(($RANDOM%${#occupation[*]}))]}
echo Mythos ${MYTHOS}'%', Sanity ${SANITY}'%/'$((100-${MYTHOS}))'%'

randflaw=""
randflaw=$(($RANDOM%4))
if [ ${randflaw} -lt 1 ]; then
  echo Flaw: ${flaw[$(($RANDOM%${#flaw[*]}))]}
fi
printf "STR ${STR}($(bonus ${STR})), "
printf "CON $CON($(bonus ${CON})), "
printf "INT ${INT}($(bonus ${INT})), "
printf "PER ${PER}($(bonus ${PER})), "
printf "POW ${POW}($(bonus ${POW})), "
printf "LCK ${LCK}($(bonus ${LCK}))"
printf "\n\n"
