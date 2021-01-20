#!/usr/bin/env python

#from sys import argv
#from sys import stdout
from random import randint
from random import choice
from faker import Faker
fake = Faker()

bystanders = [['Busybody', 'Motivated to interfere in other people’s plans'],
                ['Detective', 'Motivated to rule out explanations'],
                ['Gossip', 'Motivated to pass on rumours'],
                ['Helper', 'Motivated to join the hunt'],
                ['Innocent', 'Motivated to do the right thing'],
                ['Official', 'Motivated to be suspicious'],
                ['Skeptic', 'Motivated to deny supernatural explanations'],
                ['Victim', 'Motivated to put themselves in danger'],
                ['Witness', 'Motivated to reveal information']
]

bystander = randint(0, len(bystanders) - 1)
print("{}, the {}. {}".format(fake.name(), bystanders[bystander][0], bystanders[bystander][1]))

# page 142 of Monster of the Week core rulebook
