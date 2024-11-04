
src="main.cpp"
bin="o_o"
deb="O_O"
infile="in"
ansfile="ans"

parse () {
	sed '/^$/d' |
		sed '/Copy/d' |
		sed 's/Sample //' |
		while read -r line; do
			if [ "$line" = "Input" ]; then
				echo -n > $infile
				f="$infile"
			elif [ "$line" = "Output" ]; then
				echo -n > $ansfile
				f="$ansfile"
			else echo $line >> $f
			fi
		done
}

tst () {
	bld && ./$bin < $infile |
		paste $ansfile - |
		comp
}

comp () {
	awk -F '\t' '{ printf "\033[0;32m%-39s", $1;
	gsub(/[ \t]+$/, "", $1);
	gsub(/[ \t]+$/, "", $2);
	if ($1 != $2) printf "\033[0;31m";
		printf "%s\033[0m\n", $2 }'
}

run () {
	bld_deb  && ./$deb
}

bld () {
	if [ "$src" -nt "$bin" ]; then
		g++ $src -std=c++17 -o $bin $@
	fi
}

bld_deb() {
	if [ "$src" -nt "$deb" ]; then
		g++ $src -std=c++17 -o $deb -DDEBUG
	fi
}
