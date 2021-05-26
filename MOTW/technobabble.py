#!/usr/bin/env python

from random import randint
from random import choice

action = ['reroute', 'reverse', 'invert', 'refine', 'isolate', 'confine', 'extrapolate',
            'excise', 'buffer', 'polarize', 'depolarize', 'decouple', 'repair', 
            'calibrate', 'enhance', 'boost', 'charge', 'spin', 'spool', 'engage',
            'contain', 'attack', 'divide', 'scan', 'recalibrate']

status = ['fluctuating', 'destabilized', 'energized', 'poisoned', 'corrupted', 'contaminated', 
            'refined', 'contained', 'unravelled', 'damaged', 'enhanced', 
            'viral', 'darknened', 'phosphorescent', '']

jargon = ['temporal', 'quantum', 'auxiliary', 'flux', 'warp', 'trilithium', 'fibronium',
            'delta', 'hyper', 'charge', 'burst', 'distortion', 'burst', 
            'retro-']

noun = ['array', 'polarity', 'fixture', 'corresponder', 'synchronicitizer', 'expander'
        'sink', 'well', 'power sink', 'spinner', 'drain', 'engine', 'generator', 
        'vane', 'conduit', 'valve', 'transmitter', 'receiver', 'condensor', 'instrumentation',
        'transfer', 'skid', 'skiff', '-inator']

print("{} the {} {} {}".format(choice(action), choice(status), choice(jargon), choice(noun)))