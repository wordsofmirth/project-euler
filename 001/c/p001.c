#include <stdio.h>
#include <math.h>

/* Compile and run:  gcc -Wall p001.c -lm -o p001  &&  ./p001 1000
 */

long long unsigned int
gauss_sum (long long unsigned int n)
{
	return n*(n+1)/2;
}

long long unsigned int
gauss_sum_mod (long long unsigned int n, long long unsigned int mod)
{
	return gauss_sum( floor( (n-1)/mod ) ) * mod;
}

int
main (int argc, char *argv[])
{
	long long unsigned int n, sum3, sum5, sum15, sum;
	sscanf(argv[1], "%Lu", &n);  /* No error checking.  Passing no
					argument or something other than a
					positive integer will result in a
					segfault, or an unexpected result,
					or a visit from the Internet Police,
					who knows.  Don't take the risk. */

	sum3 = gauss_sum_mod(n, 3);
	sum5 = gauss_sum_mod(n, 5);
	sum15 = gauss_sum_mod(n, 15);
	sum = (sum3 + sum5) - sum15;

	printf("%llu\n", sum);
	
	return 0;
}

