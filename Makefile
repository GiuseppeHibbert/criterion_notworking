# This Makefile was created automatically by the makeMake script, version 1.0, on Thu Nov 14 09:48:14 PM EST 2024

# Variables used by makefile

# OS identification from: https://stackoverflow.com/questions/714100/os-detecting-makefile
#
OS := $(shell uname -s)

ifeq ($(OS), Darwin) 
  INCLUDE_PATH := /opt/homebrew/Cellar/criterion/2.4.1_1/include
  LIB_PATH := /opt/homebrew/Cellar/criterion/2.4.1_1/lib
endif
ifeq ($(OS), Linux) 
  INCLUDE_PATH := /util/criterion/include
  LIB_PATH := /util/criterion/lib/x86_64-linux-gnu
endif


CC := gcc
CFLAGS := -std=c11 -Wall -fprofile-arcs -ftest-coverage -lgcov
EXE := blocks
OBJECTS := tests.o blocks.o


# Recipes used by makefile

blocks.o: blocks.c
	$(CC) $(CFLAGS) -c blocks.c

tests.o: tests.c blocks.h
	$(CC) $(CFLAGS) -I $(INCLUDE_PATH) -c tests.c

tests: tests.o blocks.o
	$(CC) $(CFLAGS) -L $(LIB_PATH) -I $(INCLUDE_PATH) -o tests $(OBJECTS) -lcriterion -lgcov




# PHONY targets

PHONY: clean
clean:	
	rm -rf *~ $(OBJECTS) $(EXE)
# End of Makefile
