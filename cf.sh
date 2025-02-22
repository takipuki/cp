
src="main.cpp"
infile="in"
ansfile="ans"
std="c++20"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	bin="bin"
	deb="deb"
	if [[ -n "$WAYLAND_DISPLAY" ]]; then
		alias pst=wl-paste
		alias cpy=wl-copy
	else
		alias pst="xclip -sel clip -o"
		alias cpy="xclip -sel clip"
	fi
else
	bin="bin.exe"
	deb="deb.exe"
	alias pst="powershell.exe -c 'Get-Clipboard'"
	alias cpy="clip.exe"
fi

if [ ! -f $bin ]; then
	touch $bin
	chmod +x $bin
fi
if [ ! -f $deb ]; then
	touch $deb
	chmod +x $deb
fi

# supports codeforces, vjudge, atcoder
parse () {
	text=$(grep -v 'Copy' | sed '/^$/d' | sed 's/Sample //')

	echo -n > $infile
	echo -n > $ansfile

	ts=$(echo "$text" | grep -c 'Input')
	if [ "$ts" != "1" ]; then
		echo $ts > $infile
		feature="-DMULTI"
	else
		feature=""
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
	bld && ./$bin < $infile | comp
}

comp () {
	paste $ansfile - | awk -F '\t' '{ printf "%-36s", $1;
	gsub(/[ \t]+$/, "", $1);
	gsub(/[ \t]+$/, "", $2);
	if ($1 != $2) printf "!  ";
	else printf "   ";
	printf "%s\n", $2 }'
}

comp_old () {
	paste $ansfile - | awk -F '\t' '{ printf "\033[0;32m%-39s", $1;
	gsub(/[ \t]+$/, "", $1);
	gsub(/[ \t]+$/, "", $2);
	if ($1 != $2) printf "\033[0;31m";
	printf "%s\033[0m\n", $2 }'
}

run () {
	bldd  && ./$deb
}

bld () {
	if [ "$src" -nt "$bin" ]; then
		g++ $src -std=$std -o $bin $feature
	fi
}

bldd() {
	if [ "$src" -nt "$deb" ]; then
		g++ $src -std=$std -o $deb -DDEBUG
	fi
}
