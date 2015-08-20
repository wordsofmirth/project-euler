import java.lang.String;
import java.lang.Long;
import java.math.*;

class P001_BigInteger {

    public static BigInteger gauss_sum (BigInteger n) {
	BigInteger numerator = n.multiply(n.add(BigInteger.ONE));
	BigInteger sum = numerator.divide(BigInteger.valueOf(2));

	return sum;
    }

    public static BigInteger gauss_sum_mod (BigInteger n, BigInteger m) {
	BigInteger n_minus_one = n.subtract(BigInteger.ONE);
	BigInteger sum = gauss_sum( n_minus_one.divide(m) );
	BigInteger result = sum.multiply(m);

	return result;
    }

    public static void main(String[] args) {
	BigInteger sum3, sum5, sum15, sum;
	BigInteger n = new BigInteger(args[0]);

	sum3 = gauss_sum_mod(n, BigInteger.valueOf(3));
	sum5 = gauss_sum_mod(n, BigInteger.valueOf(5));
	sum15 = gauss_sum_mod(n, BigInteger.valueOf(15));
	sum = sum3.add(sum5);
	sum = sum.subtract(sum15);

	System.out.println(sum.toString());
    }
}
