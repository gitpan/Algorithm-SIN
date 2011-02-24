#!perl

use Test::More tests => 1;

use strict; use warnings;
use Algorithm::SIN;

my ($status, $got, $sin);
$sin = '046 45 286';
eval { $status = Algorithm::SIN::validate($sin); };
$got = $@;
chomp($got);
like($got, qr/ERROR: Validation failed \[SIN should contains 9 digits\]/);