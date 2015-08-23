#!/usr/bin/env perl

use warnings;
use strict;
use Math::BigInt only => 'GMP';	# See q001_gmp.c

my $n = Math::BigInt->new($ARGV[0]);

# Gauss's formula for summation of sequence from 0 to n.
sub gauss_sum
{
    my $n = $_[0];
    my $n_plus_one = $n->copy()->badd(1);
    my $numerator = $n->copy()->bmul($n_plus_one);

    my $quotient = $numerator->copy()->bdiv(2);

    return $quotient;
}


# Using Gauss's formula to sum every nth number.
sub gauss_sum_mod
{
    my ($n, $m) = @_;
    my $sum = $m->copy()->bmul( gauss_sum( $n->copy->bsub(1)->bdiv($m) ) );

    return $sum;
}

my $sum3 = gauss_sum_mod($n,Math::BigInt->new(3));
my $sum5 = gauss_sum_mod($n,Math::BigInt->new(5));
my $sum15 = gauss_sum_mod($n,Math::BigInt->new(15));	# Sum of twice-counted numbers.
my $sum = $sum3->copy()->badd($sum5)->copy->bsub($sum15);

print $sum."\n";
