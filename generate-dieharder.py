#!/usr/bin/env python3
"""Generate random number in dieharder format.

Usage: %(prog)s [--binary]
"""
import random
import sys

R = random
seed = 132002070
R.seed(seed)
numbit = 32

text_mode = '--binary' not in sys.argv
if text_mode: # finite file in text format
    N=2000000000
    print("""\
#==================================================================
# generator python  seed = {seed}
#==================================================================
type: d
count: {N}
numbit: {numbit}""".format_map(vars()))
    for _ in range(N):
        print(R.randrange(2**32))
else: # infinite binary stream
    import os
    while True:
        os.write(1, R.getrandbits(numbit).to_bytes(numbit//8, 'big'))
