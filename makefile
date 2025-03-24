flags = -std=c++20

out/main: main.cpp
	g++ $(flags) $^ -o $@

out/deb: main.cpp
	g++ $(flags) -DDEBUG $^ -o $@
