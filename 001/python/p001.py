#!/usr/bin/python -O 

import sys

def gauss_sum (n):
    return( (n * (n+1)) / 2)

def gauss_sum_mod (n, m):
    return (gauss_sum((n-1) / m) * m)

n = int(sys.argv[1])
sum3 = gauss_sum_mod(n, 3)
sum5 = gauss_sum_mod(n, 5)
sum15 = gauss_sum_mod(n, 15)
s = (sum3 + sum5) - sum15
print(s)
