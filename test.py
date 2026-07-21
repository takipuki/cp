#! /usr/bin/python3

import sys
from subprocess import run

if len(sys.argv) < 2:
    print(f'''\
USAGE
    {sys.argv[0]} <program> < input.txt
''')
    sys.exit(1)


def cmp(ans, out):
    ans = ans.strip().splitlines()
    out = out.strip().splitlines()
    ans += [''] * (max(len(ans), len(out)) - len(ans))
    out += [''] * (max(len(ans), len(out)) - len(out))
    passed = True
    for i in range(len(ans)):
        if ans[i].rstrip() == out[i]:
            print(f'{ans[i]:<35}   {out[i]:<35}')
        else:
            print(f'{ans[i]:<35} | {out[i]:<35}')
            passed = False
    return passed


cases = sys.stdin.read().strip().split('\n======\n')

pass_cnt = 0
for tc, case in enumerate(cases, 1):
    print(f'TEST CASE: {tc}')
    inp, ans = case.split('\n---\n')
    proc = run(sys.argv[1], shell=False, text=True, input=inp, capture_output=True)
    if proc.returncode != 0:
        print("RUNTIME ERROR", file=sys.stderr)
        print(case)
        sys.exit(1)
    if cmp(ans, proc.stdout): pass_cnt += 1

print(f'PASSED: {pass_cnt}/{len(cases)}')
