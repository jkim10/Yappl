CC = gcc
CFLAGS = -g -Wall

compile:
	$(CC) $(CFLAGS) sampling.c -o sampling
	$(CC) $(CFLAGS) distribution.c -o distribution

.PHONY: clean
clean:
	rm -rf sampling distribution *.o *.dSYM a.out
