import sys
import os

test_cases = sys.stdin.read().strip().split('Input')[1:]
for test in test_cases:
    print(f'  $ {os.getcwd()}/main << EOF')
    inp, out = test.split('Output')
    for line in inp.strip().splitlines():
        print('  >', line)
    print('  > EOF')
    for line in out.strip().splitlines():
        print(' ', line)
    print()
