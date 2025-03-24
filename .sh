#! /usr/bin/sh

r () {
	make -s out/deb && out/deb
}


rf () {
	make -Bs out/deb && out/deb
}


tst () {
	make -s out/main || exit $?
	mkfifo .tmp
	for f in out/in*; do
		(sed '1,/output/Id' "$f" > .tmp &)
		sed -n '/output/Iq;p' "$f" \
			| out/main \
			| comp .tmp
	done
	rm -f .tmp
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

	rm in*
	sed '/^$/d' \
		| sed '/copy/Id' \
		| csplit - '/[Ii]nput/' '{*}' -f in -z --suppress-matched -s

	cd .. || exit
}
