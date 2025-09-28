flags = -std=c++23 \
		-Wall \
		-Wfatal-errors \
		-Wno-unused-variable \
		-Wno-sign-compare \
		-fsanitize=signed-integer-overflow \
		-fsanitize=address \
		-fno-omit-frame-pointer
dflags = -g -Werror

deb = deb
main = main

$(deb): main.cpp
	g++ $(flags) $(dflags) -DDEBUG $< -o $@

$(main): main.cpp
	g++ $(flags) -DNDEBUG -O2 $< -o $@

parse:
	sed -E 's/([Cc]opy|[Ss]ample) *//g' \
		| sed -E '/^$$/d' \
		| sed -E 's/[Ii]nput/======/' \
		| sed -E 's/[Oo]utput/---/' \
		| sed '1d' > in.txt

test: test.py $(main)
	./$< < in.txt

watch_deb: main.cpp
	echo $< | entr -c make -s $(deb)

watch_main: main.cpp
	echo $< | entr -c make -s $(main)
