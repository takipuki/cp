flags = -std=c++20 -Wall -Wno-unused-variable -Wno-sign-compare -fsanitize=signed-integer-overflow -fsanitize=address -fno-omit-frame-pointer
dflags = -Werror

deb: main.cpp
	g++ $(dflags) $(flags) -DDEBUG $< -o $@

main: main.cpp
	g++ $(flags) $< -o $@

prs: parse.py
	grep -Eiv '^(copy)?$$' | python $< > cram.t

tst: cram.t main
	cram $<
