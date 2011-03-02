use strict;use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME          => 'Algorithm::SIN',
    AUTHOR        => q{Mohammad S Anwar <mohammad.anwar@yahoo.com>},
    VERSION_FROM  => 'lib/Algorithm/SIN.pm',
    ABSTRACT_FROM => 'lib/Algorithm/SIN.pm',
    dist          => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean         => { FILES => 'Algorithm-SIN-*' },
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PREREQ_PM     => {
        'Test::More' => 0,
		'Readonly'   => 0,
    },
);