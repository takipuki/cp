include .env

flags = \
	-std=c++17 \
	-g3 \
	-Werror \
	-Wall \
	-Wfatal-errors \
	-Wno-unused-variable \
	-Wno-sign-compare \
	-Wconversion \
	-D_GLIBCXX_DEBUG \
	-fsanitize=signed-integer-overflow \
	$(extra)
	# -fsanitize=address \
	# -fno-omit-frame-pointer \

$(DEB): main.cpp
	g++ $(flags) -DDEBUG $< -o $@

$(MAIN): main.cpp
	g++ $(flags) -DLOCAL -DNDEBUG -O2 $< -o $@

fast_main: main.cpp
	g++ -std=c++17 -DLOCAL -DNDEBUG -O2 $< -o $(MAIN)

parse:
	sed -E 's/(copy|sample) *//ig' \
		| sed -E '/^$$/d' \
		| sed -E 's/.*input:?.*/======/i' \
		| sed -E 's/.*(output:?|\t).*/---/i' \
		| sed '1d' > $(INPUT)

get_testcase:
	[ -z "$(tc)" ] && cat $(INPUT) || awk -v RS='======' "NR==$(tc)" < $(INPUT)

test: test.py $(MAIN)
	python ./$< $(MAIN) < $(INPUT)

watch_deb: main.cpp
	echo $< | entr -rc make -sB $(DEB)

watch_main: main.cpp
	echo $< | entr -rc make -sB $(MAIN)
