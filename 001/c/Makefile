
all: p001 p001_gmp

p001: p001.c
	gcc -Wall $^ -lm -o $@

p001_gmp: p001_gmp.c
	gcc -Wall $^ -lgmp -o $@

clean:
	rm -f p001 p001_gmp *.o *~
