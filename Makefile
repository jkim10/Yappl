CC=gcc
CFLAGS= -g -Wall
LDFLAGS= -g

default: microc.native libdist.a

microc.native:
	ocamlbuild -use-ocamlfind microc.native -pkgs llvm

libdist.a: dist.o
	ar -crs libdist.a dist.o
	ranlib libdist.a

dist.o: dist.h dist.c

.PHONY: clean
clean:
	ocamlbuild -clean
	rm -f *.native 
	rm -f *.o *.a *.s a.out *.byte
