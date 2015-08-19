Problem 1 - Multiples of 3 and 5
================================

The Problem
-----------

If we list all the natural numbers below 10 that are multiples of 3 or 5, we
get 3, 5, 6, and 9.  The sum of these multiples is 23.  

Find the sum of all multiples of 3 or 5 below 1,000.

Solutions
---------

The subdirectories here contain implementations of solutions to problem 1 from
http://www.projecteuler.net , in Perl, C, Java, Ocaml, and Python.

Each file contains compilation instructions at the top, in comments.

Further discussion here: http://lab220.compsoc.com/blog/

* These are simple solutions which work for the problem as stated.
    * `c/p001.c`
    * `java/P001.java`
    * `ocaml/p001.ml`
    * `perl/p001.pl`
    * `python/p001.py`
* These are solutions which work for much larger numbers
    * `c/p001_gmp.c`
        * Uses `libgmp`, the GNU Multiple Precision library.
        * Considerably longer than `p001.c` and less obviously comprehensible.
    * `java/P001_BigInteger.java`
        * Uses `BigInteger` objects from java.math for large number support.
        * `BigInteger` objects are immutable - compare to Perl's `Math::BigInt`
        * More elegant than C, less so than ocaml
    * `ocaml/p001_num.ml`
        * Uses `Num` module for large number support.
	    * `Num` uses `Big_int`
        * Provides a `num` data type to store large numbers
	    * Also: math functions, and operators, to work with this type
        * Almost the same length as `p001.ml`
	* Operators less verbose than functions, but maybe harder to read
    * `perl/p001_bigint.pl`
        * Uses `bigint` module promises transparent support for large numbers
            * Implemented in turn by the `Math::BigInt` module.
            * Overloads perl's math operators.
        * Produces incorrect results for large numbers!
            * Availability of `Math::BigInt::GMP` does not affect this.
    * `perl/p001_math_bigint_calc.pl`
        * Uses `Math::BigInt::Calc`, a native perl module.
            * `Math::BigInt` objects are mutable, this leads to inelegant code.
            * Perl uses this as a fallback if no better library is available.
        * Slow!
    * `perl/p001_math_bigint_gmp.pl`
        * User `Math::BigInt::GMP`, a perl interface to `libgmp`.
            * `Math::BigInt` automatically uses this if available.
        * `Math::BigInt` objects are mutable, this leads to inelegant code.
        * As fast as the C implementation using `libgmp`, pretty much.

