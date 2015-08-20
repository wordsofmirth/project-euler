import java.lang.String;
import java.lang.Long;

class P001 {

    public static long gauss_sum (long n) {
	return n*(n+1)/2;
    }

    public static long gauss_sum_mod (long n, long m) {
	return gauss_sum( (n-1)/m ) * m;
    }

    public static void main(String[] args) {
	long sum3, sum5, sum15, sum;
	long n = Long.parseLong(args[0], 10);

	sum3 = gauss_sum_mod(n, 3);
	sum5 = gauss_sum_mod(n, 5);
	sum15 = gauss_sum_mod(n, 15);
	sum = (sum3 + sum5) - sum15;

	System.out.println(sum);
    }
}

