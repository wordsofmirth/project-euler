#include <stdio.h>
#include <stdlib.h>
#include <gmp.h>

/* libgmp provides "multiple precision" integers.
 *
 * Note: need to pass -lgmp to gcc for libgmp
 */

enum { base10 = 10 };

void gauss_sum(mpz_t, const mpz_t);
void gauss_sum_mod(mpz_t, const mpz_t, const mpz_t);


/* Computes sum of a series 1..n */
void
gauss_sum (mpz_t result, const mpz_t n)
{
	mpz_t n_plus_one, divisor, numerator;

	/* Determining the numerator. */
	mpz_init(numerator);
	mpz_init(n_plus_one);
	mpz_add_ui(n_plus_one, n, (long unsigned int)1);
	mpz_mul(numerator, n, n_plus_one);

	/* Divisor is always 2. */
	mpz_init_set_si(divisor, (long int)2);

	/* n(n+1)/2 */
	mpz_fdiv_q(result, numerator, divisor);

	mpz_clear(n_plus_one);
	mpz_clear(divisor);
	mpz_clear(numerator);
}


/* Computes sum of all terms in series 1..n divisible evenly by mod */
void
gauss_sum_mod (mpz_t result, const mpz_t n, const mpz_t mod)
{
	mpz_t n_minus_one, quotient, scaled_sum;
	
	mpz_init(n_minus_one);
	mpz_init(quotient);
	mpz_init(scaled_sum);

	/* n-1 */
	mpz_sub_ui(n_minus_one, n, (long unsigned int)1);

	/* (n-1)/mod */
	mpz_fdiv_q(quotient, n_minus_one, mod);

	gauss_sum(scaled_sum, quotient);

	mpz_mul(result, scaled_sum, mod);

	mpz_clear(n_minus_one);
	mpz_clear(quotient);
	mpz_clear(scaled_sum);
}


int
main (int argc, char *argv[])
{
	mpz_t n, sum3, sum5, sum15, sum3_5, sum;
	mpz_t three, five, fifteen;
	char *sum_str;

	mpz_init(n);
	mpz_init(sum3);
	mpz_init(sum5);
	mpz_init(sum15);
	mpz_init(sum3_5);
	mpz_init(sum);
	mpz_init_set_ui(three, (long long unsigned int) 3);
	mpz_init_set_ui(five, (long long unsigned int) 5);
	mpz_init_set_ui(fifteen, (long long unsigned int) 15);

	mpz_init_set_str(n, argv[1], base10);
	gauss_sum_mod(sum3, n, three);
	gauss_sum_mod(sum5, n, five);
	gauss_sum_mod(sum15, n, fifteen);
	
	mpz_add(sum3_5, sum3, sum5);
	mpz_sub(sum, sum3_5, sum15);

	sum_str = mpz_get_str(NULL, base10, sum);
	printf("%s\n", sum_str);
	
	mpz_clear(n);
	mpz_clear(sum3);
	mpz_clear(sum5);
	mpz_clear(sum15);
	mpz_clear(sum3_5);
	mpz_clear(sum);
	mpz_clear(three);
	mpz_clear(five);
	mpz_clear(fifteen);

	return 0;
}

