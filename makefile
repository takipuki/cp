include .env

flags = -std=c++17 \
		-Wall \
		-Wfatal-errors \
		-Wno-unused-variable \
		-Wno-sign-compare \
		-fsanitize=signed-integer-overflow \
		-fsanitize=address \
		-fno-omit-frame-pointer \
		$(extra)

dflags = -g -Werror

$(DEB): main.cpp
	g++ $(flags) $(dflags) -DDEBUG $< -o $@

$(MAIN): main.cpp
	g++ $(flags) -DLOCAL -DNDEBUG -O2 $< -o $@

fast_main: main.cpp
	g++ -std=c++17 -DLOCAL -DNDEBUG -O2 $< -o $(MAIN)

parse:
	sed -E 's/(copy|sample) *//ig' \
		| sed -E '/^$$/d' \
		| sed -E 's/input:?/======/i' \
		| sed -E 's/output:?/---/i' \
		| sed '1d' > $(INPUT)

test: test.py $(MAIN)
	python ./$< < $(INPUT)

watch_deb: main.cpp
	echo $< | entr -rc make -sB $(DEB)

watch_main: main.cpp
	echo $< | entr -rc make -sB $(MAIN)
