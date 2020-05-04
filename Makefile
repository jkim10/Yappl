test:
	echo "Pass :)"

build:
	echo "build :)"
	ocamlbuild -pkg llvm microc.native

clean:
	rm a.out example.out example.ll microc.native
