include .env

flags = -std=c++20 \
		-Wall \
		-Wfatal-errors \
		-Wno-unused-variable \
		-Wno-sign-compare \
		-fsanitize=signed-integer-overflow \
		-fsanitize=address \
		-fno-omit-frame-pointer
dflags = -g -Werror

$(DEB): main.cpp
	g++ $(flags) $(dflags) -DDEBUG $< -o $@

$(MAIN): main.cpp
	g++ $(flags) -DNDEBUG -O2 $< -o $@

parse:
	sed -E 's/(copy|sample) *//ig' \
		| sed -E '/^$$/d' \
		| sed -E 's/input:?/======/i' \
		| sed -E 's/output:?/---/i' \
		| sed '1d' > $(INPUT)

test: test.py $(MAIN)
	python ./$< < $(INPUT)

watch_deb: main.cpp
	echo $< | entr -c make -s $(DEB)

watch_main: main.cpp
	echo $< | entr -c make -s $(MAIN)
