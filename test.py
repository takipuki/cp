#! /usr/bin/python3

from sys import stdin
from subprocess import run

def cmp(ans, out):
    ans = ans.strip().split('\n')
    out = out.strip().split('\n')
    ans += [''] * (max(len(ans), len(out)) - len(ans))
    out += [''] * (max(len(ans), len(out)) - len(out))
    for i in range(len(ans)):
        if ans[i] == out[i]:
            print(f'{ans[i]:<35}   {out[i]:<35}')
        else:
            print(f'{ans[i]:<35} | {out[i]:<35}')

cases = stdin.read().strip().split('\n======\n')

for case in cases:
    inp, ans = case.split('\n---\n')
    proc = run('./main', shell=True, text=True, input=inp, capture_output=True)
    if proc.returncode != 0:
        print("FAILED")
        print(case)
        sys.exit(0)
    cmp(ans, proc.stdout)
