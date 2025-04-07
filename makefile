flags = -std=c++23

out/main.exe: main.cpp
	g++ $(flags) $^ -o $@

out/deb.exe: main.cpp
	g++ $(flags) -DDEBUG $^ -o $@
