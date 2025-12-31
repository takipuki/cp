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
