use strict;use warnings;
use Module::Build;

my $builder = Module::Build->new(
    sign              => 1,
    module_name       => 'Algorithm::SIN',
    license           => 'perl',
    dist_author       => q{Mohammad S Anwar <mohammad.anwar@yahoo.com>},
    dist_version_from => 'lib/Algorithm/SIN.pm',
    add_to_cleanup    => [ 'Algorithm-SIN-*' ],
    build_requires    => {
        'Test::More'    => 0,
        'Readonly'      => 0,
        'Module::Build' => '0.36',
    },
);

$builder->create_build_script();