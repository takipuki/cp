include .env

flags = \
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

$(DEB): main.cpp debug.cpp
	g++ $(CXXFLAGS) $(flags) -DDEBUG $< -o $@

$(MAIN): main.cpp
	g++ $(CXXFLAGS) $(flags) -DLOCAL -DNDEBUG -O2 $< -o $@

fast_main: main.cpp
	g++ $(CXXFLAGS) -DLOCAL -DNDEBUG -O2 $< -o $(MAIN)

parse:
	sed -E 's/(copy|sample) *[0-9]*//ig' \
		| sed -E '/^$$/d' \
		| sed -E 's/.*input:?.*/======/i' \
		| sed -E 's/.*(output:?|\t).*/---/i' \
		| sed '1d' > $(INPUT)

get_testcase:
	[ -z "$(tc)" ] && cat $(INPUT) || awk -v RS='======' "NR==$(tc)" < $(INPUT) | grep -v '^$$'

test: test.py $(MAIN)
	python ./$< $(MAIN) < $(INPUT)

watch_deb: main.cpp debug.cpp
	ls $^ | entr -rc make -sB $(DEB)

watch_main: main.cpp
	ls $^ | entr -rc make -sB $(MAIN)
