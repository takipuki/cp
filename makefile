CC = g++
CFLAGS = -std=c++20
# -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion
LINKS =
EXE = exe

cf: main.cpp
	$(CC) $(CFLAGS) $(LINKS) $^ -o $(EXE)

deb: main.cpp
	$(CC) -DDEBUG $(CFLAGS) $(LINKS) $^ -o $(EXE)
