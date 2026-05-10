#! /usr/bin/sh

. ./.env

rn () {
	make -s "$DEB" && "./$DEB"
}

rnm () {
	make -s "$MAIN" && "./$MAIN"
}

tst () {
	make -s test
}

prs () {
	make -s parse
}

t () {
	make -s get_testcase tc="$1"
}

gr () {
	awk '/./ {printf("%d-(%d)-%d\n", $1, $3, $2)}'
}

rg () {
	awk -F '-' '/./ {printf("%d %d %s\n", $1, $3, $2)}' | tr -d '()'
}

alias gdb='ASAN_OPTIONS=detect_leaks=0 gdb'
alias gf2='ASAN_OPTIONS=detect_leaks=0 gf2'
