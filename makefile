CC = g++
CFLAGS =
# -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion
LINKS =
EXE = exe

cf: main.cpp
	$(CC) -DONLINE_JUDGE $(CFLAGS) $(LINKS) $^ -o $(EXE)

deb: main.cpp
	$(CC) $(LINKS) $^ -o $(EXE)
