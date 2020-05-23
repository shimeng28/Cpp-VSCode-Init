src = $(wildcard ./src/*.cpp)
obj = $(patsubst ./src/%.cpp, ./obj/%.o, $(src))

args = -std=c++17 -stdlib=libc++ -Wall -g
headerPath = ./include

ALL: main

main:$(obj)
	clang++ $^ -o $@ $(args)

$(obj):./obj/%.o:./src/%.cpp
	clang++ -c $< -o $@ $(args)  -I $(headerPath)

clean:
	-rm -rf ./obj/*.o main

.PHONY:clean ALL

