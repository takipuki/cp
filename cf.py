import sys, os, re, subprocess

src = 'main.cpp'
bin = 'bin'
deb = 'deb'
std = 'c++20'
fname_features = '.cf'
fname_in = 'in'
fname_ans = 'ans'

if os.name == 'nt':
	bin += '.exe'
	deb += '.exe'

def run():
	build(deb, '-DDEBUG')
	os.system(f'./{deb}')


def build(fname_bin, features=''):
	if not features:
		try:
			with open(fname_features, 'r') as f:
				features = f.read()
		except:
			pass
	if os.path.getmtime(src) > os.path.getmtime(fname_bin):
		os.system(f'g++ {src} -std={std} -o {fname_bin} {features}')


def parse():
	tests = 0
	inp = []
	out = []
	cur = inp
	for line in sys.stdin:
		line = line.strip()
		if not line or line == 'Copy':
			continue
		if re.match(r'input:?', line, flags=re.I):
			tests += 1
			cur = inp
		elif re.match(r'output:?', line, flags=re.I):
			cur = out
		else:
			cur.append(line)

	inp = '\n'.join(inp)
	out = '\n'.join(out)

	if tests > 1:
		with open(fname_features, 'w') as f:
			f.write('-DMULTI')
		inp = str(tests) + '\n' + inp
	else:
		with open(fname_features, 'w') as f:
			f.write('')

	with open(fname_in, 'w') as f_in, open(fname_ans, 'w') as f_ans:
		f_in.write(inp)
		f_ans.write(out)


def test():
	build(bin)

	out = []
	ans = []
	with open(fname_in, 'r') as f:
		out = subprocess.check_output(f'./{bin}', stdin=f, text=True).splitlines()
	with open(fname_ans, 'r') as f_ans:
		ans = f_ans.read().splitlines()

	for a, o in zip(map(str.strip, ans), map(str.strip, out)):
		if a == o:
			print(f'{a:<40}{o}')
		else:
			print(f'{a:<37}!  {o}')


opts = {
	'run': run,
	'bld': lambda: build(bin),
	'bldd': lambda: build(deb, '-DDEBUG'),
	'parse': parse,
	'test': test,
}

if len(sys.argv) > 1 and sys.argv[1] in opts:
	opts[sys.argv[1]]()
else:
	print(f'commands: {", ".join(opts.keys())}')

