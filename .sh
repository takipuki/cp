#! /usr/bin/sh

source .env

rn () {
	make -s $DEB && ./$DEB
}

rf () {
	make -Bs $DEB && ./$DEB
}

tst () {
	make -s test
}

prs () {
	make -s parse
}

TIMEFMT='%E'
usc () {
	rm -rf usaco
	7z x -aoa -ousaco "$1" > /dev/null
	(cd usaco && perl-rename 's/^\d\./0$&/' *)
}

usct () {
	make -s $MAIN || return
	ls -1 -d usaco/*.in |
		sort -n |
		while read f; do
			f=${f%.in}
			echo -n test $f
			time (
				./main < $f.in |
					diff -wq $f.out - > /dev/null &&
					echo -n '   ' ||
					echo -n ' ! '
			)
		done
}

alias gdb='ASAN_OPTIONS=detect_leaks=0 gdb'


bodd () {
	[ -n "$1" -o main.odin -nt deb ] && odin build main.odin \
		-file -out:deb \
		-sanitize:address
}

bod () {
	[ -n "$1" -o main.odin -nt main ] && odin build main.odin \
		-file -out:main \
		-no-bounds-check \
		-o:speed \
		-no-type-assert
}

wod () {
	echo main.odin |
		entr -rc odin build main.odin \
			-file -out:deb \
			-sanitize:address
}
