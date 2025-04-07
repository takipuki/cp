#! /usr/bin/sh

r () {
	make -s out/deb.exe && out/deb.exe
}


rf () {
	make -Bs out/deb.exe && out/deb.exe
}


tst () {
	make -s out/main.exe || exit $?
	rm -f .tmp
	mkfifo .tmp
	for f in out/in*; do
		(sed '1,/output/Id' "$f" > .tmp &)
		sed -n '/output/Iq;p' "$f" \
			| out/main.exe \
			| comp .tmp
	done
}


comp () {
	paste "$1" - | awk -F'\t' '{
		gsub(/ +$/, "", $1);
		gsub(/ +$/, "", $2);
		if ($1 == $2) printf("%-32s%s\n", $1, $2);
		else printf("%-30s! %s\n", $1, $2);
		}'
}


prs () {
	mkdir -p out
	cd out || exit

	rm -f in*
	sed '/^$/d' \
		| sed '/copy/Id' \
		| csplit - '/[Ii]nput/' '{*}' -f in -z --suppress-matched -s

	cd .. || exit
}
