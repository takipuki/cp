flags = -std=c++23 \
		-Wall \
		-Wfatal-errors \
		-Wno-unused-variable \
		-Wno-sign-compare \
		-fsanitize=signed-integer-overflow \
		-fsanitize=address \
		-fno-omit-frame-pointer
dflags = -g -Werror

deb: main.cpp
	g++ $(dflags) $(flags) -DDEBUG $< -o $@

main: main.cpp
	g++ $(flags) -O2 $< -o $@

parse:
	sed -E 's/([Cc]opy|[Ss]ample) *//g' | sed -E '/^$$/d' | sed '1d' > in.txt

test: test.clj main
	./$<

watch_deb: main.cpp
	echo $< | entr -c make -s deb

watch_main: main.cpp
	echo $< | entr -c make -s main
