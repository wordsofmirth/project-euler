
all: p001 p001_num p001_bigint

p001: p001.ml
	ocamlopt -o $@ $^

p001_bigint: p001_bigint.ml
	ocamlopt -o $@ nums.cmxa $^

p001_num: p001_num.ml
	ocamlopt -o $@ nums.cmxa $^

clean:
	rm -f p001 p001_num p001_bigint *.cmi *.cmx *.o *~