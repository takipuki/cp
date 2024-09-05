CC = g++
CFLAGS =
# -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion
LINKS =
EXE = exe

cf: main.cpp
	$(CC) $(CFLAGS) $(LINKS) $^ -o $(EXE)

deb: main.cpp
	$(CC) -DLOCAL $(LINKS) $^ -o $(EXE)
