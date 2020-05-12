CC = gcc
CFLAGS = -g -Wall
LDFLAGS = -g

sampling: sampling.o
	$(CC) $(LDFLAGS) sampling.o -o $@

sampling.o: sampling.c
	$(CC) $(CFLAGS) -c $<

compile: sampling.c
	# gcc -g -Wall -c sampling.c --> sampling.o
	cc -o sampling -DBUILD_TEST sampling.c

.PHONY: clean
clean:
	rm -rf sampling *.o a.out
