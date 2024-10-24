
src="main.cpp"
bin="o_o"
infile="in"
ansfile="ans"

cf () {
	sed '/^$/d' |
		sed '/Copy/d' |
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
		awk -F '\t' '{ printf "\033[0;32m%-39s", $1;
			gsub(/[ \t]+$/, "", $1);
			gsub(/[ \t]+$/, "", $2);
			if ($1 != $2) printf "\033[0;31m";
				printf "%s\033[0m\n", $2 }'
}

run () {
	bld -DDEBUG && ./$bin
}

bld () {
	if [ "$src" -nt "$bin" ]; then
		g++ $src -std=c++17 -o $bin $@
	fi
}

