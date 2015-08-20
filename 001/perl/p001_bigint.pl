#!/usr/bin/env perl

# This produces incorrect results with large numbers.

use warnings;
use strict;
use bigint;
use POSIX;	# for floor()

my $n = $ARGV[0];

# Gauss's formula for summation of sequence from 0 to n.
sub gauss_sum { return ($_[0]*($_[0]+1) / 2) }

# Using Gauss's formula to sum every nth number.
sub gauss_sum_mod { gauss_sum( floor(($_[0]-1)/$_[1]) ) * $_[1] }

my $sum3 = gauss_sum_mod($n,3);
my $sum5 = gauss_sum_mod($n,5);
my $sum15 = gauss_sum_mod($n,15);	# Sum of twice-counted numbers.
my $sum = $sum3 + $sum5 - $sum15;

print $sum."\n";
