#!/usr/bin/env python3
"""Generate random number in dieharder format.

Usage: %(prog)s [--binary | <numbit>]
"""
import random
import sys
from functools import partial

R = random
seed = 132002070
R.seed(seed)

text_mode = '--binary' not in sys.argv
if text_mode: # finite file in text format
    numbit = 32 if len(sys.argv) < 2 else int(sys.argv[1])
    N=2000000000
    gen = partial(R.randrange, 2**numbit)
    print("""\
#==================================================================
# generator python  seed = {seed}
#==================================================================
type: d
count: {N}
numbit: {numbit}""".format_map(vars()))
    for _ in range(N):
        print("%10d" % gen())
else: # infinite binary stream
    import os
    import sys
    write = sys.stdout.buffer.write
    while True:
        write(R.getrandbits(32).to_bytes(4, 'big'))
