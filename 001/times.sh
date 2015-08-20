#!/bin/bash

outfile="/tmp/times.$$.csv"
echo "$outfile"

c="c/p001_gmp"
java="java/P001_BigInteger.class"
ocaml="ocaml/p001_num ocaml/p001_bigint"
perl="perl/p001_math_bigint_calc.pl perl/p001_math_bigint_gmp.pl"
python="python/p001.py"

echo "implementation,exponent,rss,time" > "$outfile"

for i in `seq 1 13`
do
	n=$((i*10000))


	for p in $c $ocaml $java $perl $python
	do
		if [ ! -f "$p" ]; then echo "Missing: $p" 2>&1; exit; fi
	done

	for p in $c $ocaml $perl $python
	do
		chmod 755 "$p" >/dev/null 2>&1
		/usr/bin/time --append --output="$outfile" --format "$p,$n,%M,%e" \
			"$p" `echo "10^$n" | BC_LINE_LENGTH=0 bc`
	done

	for p in $java
	do
		d="`dirname \"$p\"`"
		b="`basename \"$p\"`"
		(
		 cd "$d" &&
		  /usr/bin/time --append --output="$outfile" --format "$p,$n,%M,%e" \
			java "${b%*.class}" `echo "10^$n" | BC_LINE_LENGTH=0 bc`
		)
	done

done >> /dev/null 2>>"$outfile"
