CC=gcc
CFLAGS= -g -Wall
LDFLAGS= -g
MYDIR = .

default: yappl.native libdist.a

yappl.native:
	ocamlbuild -use-ocamlfind yappl.native -pkgs llvm

libdist.a: dist.o
	ar -crs libdist.a dist.o
	ranlib libdist.a

dist.o: dist.h dist.c

.PHONY: clean
clean:
	ocamlbuild -clean
	rm -f *.native 
	rm -f *.o *.a *.s a.out *.byte llvm.out
test: clean default
	find "./tests/" -name "test*.mc" -type f -exec ./yappl.native {} \; -exec ./a.out {} \;
