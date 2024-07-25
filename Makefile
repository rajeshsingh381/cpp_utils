CXXFLAGS = -Wall -Wextra -pedantic-errors -O3
SHARED_FLAGS = -fPIC -shared
LDFLAGS = lib3rdparty.a
SRC_PATH = src
INCLUDE_PATH = include

.PHONY: all
all: myapp test

test:
	gcc -g $(CXXFLAGS) -I $(INCLUDE_PATH)/ -o app_util.o -c app_util.c
	gcc -g $(CXXFLAGS) -I $(INCLUDE_PATH)/ -o app_cmd app_util.o test_util.c $(LDFLAGS)
	@chmod +x app_cmd

myapp:
	gcc -g $(CXXFLAGS) -I $(INCLUDE_PATH)/ -o libappintf.so app_util.c $(LDFLAGS) $(SHARED_FLAGS)

.PHONY: clean
clean:
	$(RM) ./app_cmd ./*.o ./*.so
