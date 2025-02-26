touch -a bin deb .cf

bld () {
	src=${1:-main.cpp}
	bin=${2:-bin}
	if [ $src -nt $bin ]; then
		g++ $src -o $bin $(cat .cf || echo -n) "${@:3}"
	fi
}

run () {
	bld "" deb -DDEBUG && ./deb
}

tst () {
	bld && ./bin < in | comp
}

comp () {
	paste ans - |
		awk -F'\t' -v OFS='\t' '{
			gsub(/ +$/, "", $1);
			gsub(/ +$/, "", $2);
			if ($1 == $2) print $0;
			else print "! " $0;
			}'
}

prs () {
	echo -n > in
	echo -n > ans

	cat | sed '/^$/d' | sed '/copy/Id' > .tmp
	ts="$(grep -i '^input' < .tmp | wc -l)"
	if [ $ts = 1 ]; then
		echo -n > .cf
	else
		echo $ts > in
		echo -n '-DMULTI' > .cf
	fi

	csplit .tmp '/[Ii]nput/' '{*}' -z --suppress-matched -s
	for f in xx*; do
		grep -B 100 -i output $f | sed '/output/Id' >> in
		grep -A 100 -i output $f | sed '/output/Id' >> ans
		rm $f
	done
}
