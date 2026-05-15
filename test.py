#! /usr/bin/python3

import sys
from subprocess import run

if len(sys.argv) < 2:
    print(f'''\
USAGE
	{sys.argv[0]} <program>
''')
    sys.exit(1)

def cmp(ans, out):
    ans = ans.strip().split('\n')
    out = out.strip().split('\n')
    ans += [''] * (max(len(ans), len(out)) - len(ans))
    out += [''] * (max(len(ans), len(out)) - len(out))
    for i in range(len(ans)):
        if ans[i].rstrip() == out[i]:
            print(f'{ans[i]:<35}   {out[i]:<35}')
        else:
            print(f'{ans[i]:<35} | {out[i]:<35}')

cases = sys.stdin.read().strip().split('\n======\n')

for case in cases:
    inp, ans = case.split('\n---\n')
    proc = run(sys.argv[1], shell=False, text=True, input=inp, capture_output=True)
    if proc.returncode != 0:
        print("FAILED", file=sys.stderr)
        print(case)
        sys.exit(1)
    cmp(ans, proc.stdout)
