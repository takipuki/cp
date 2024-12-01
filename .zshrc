
src="main.cpp"
infile="in"
ansfile="ans"
std="c++20"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	bin="bin"
	deb="deb"
elif [[ "$OSTYPE" == "cygwin" || "$OSTYPE" == "msys" ]]; then
	bin="bin.exe"
	deb="deb.exe"
	alias pst="powershell.exe -c 'Get-Clipboard'"
	alias cpy="clip.exe"
fi

touch $bin $deb
chmod +x $bin $deb

# supports codeforces, vjudge, atcoder
parse () {
	text=$(grep -v 'Copy' | sed '/^$/d' | sed 's/Sample //')

	echo -n > $infile
	echo -n > $ansfile

	ts=$(echo "$text" | grep -c 'Input')
	if [ "$ts" != "1" ]; then
		echo $ts > $infile
	fi

	echo "$text" | while read -r line; do
		if [[ "$line" =~ "Input:?" ]]; then
			f="$infile"
		elif [[ "$line" =~ "Output:?" ]]; then
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
		g++ $src -std=$std -o $bin $@
	fi
}

bld_deb() {
	if [ "$src" -nt "$deb" ]; then
		g++ $src -std=$std -o $deb -DDEBUG
	fi
}
