#! /usr/bin/sh

rn () {
	make -s deb && ./deb
}


rf () {
	make -Bs deb && ./deb
}


tst () {
	make -s test
}


prs () {
	make -s parse
}
