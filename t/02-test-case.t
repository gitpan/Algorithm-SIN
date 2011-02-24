#!perl

use Test::More tests => 3;

use strict; use warnings;
use Algorithm::SIN;

my ($status, $sin);
$sin = '046 454 286';
eval { $status = Algorithm::SIN::validate($sin); };
is($status, 1);

$sin = '046-454-286';
eval { $status = Algorithm::SIN::validate($sin); };
is($status, 1);

$sin = '012 345 678';
eval { $status = Algorithm::SIN::validate($sin); };
is($status, 0);