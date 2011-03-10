package Algorithm::SIN;

use strict; use warnings;

=head1 NAME

Algorithm::SIN - Interface to validate Social Insurance number (Canada).

=head1 VERSION

Version 0.06

=cut

our $VERSION = '0.06';

use Carp;
use Readonly;
use Data::Dumper;

=head1 SYNOPSIS

    use Algorithm::SIN;

    my $sin = '046-454-286';
    my $status = Algorithm::SIN::validate($sin);

=head1 METHODS

=head2 validate

This method accepts Social Insurance number and validate it against the Canada format.
For more information please visit http://en.wikipedia.org/wiki/Social_Insurance_Number

=cut

sub validate 
{
    my $sin = shift;
    return 0 unless defined $sin;
    
    chomp($sin);    
    $sin =~ s/\s//g;
	$sin =~ s/\-//g;
    
    croak("ERROR: Validation failed [SIN should contains 9 digits]\n") if (length($sin) != 9);
    
    my @sin = split(//,$sin);
    my $step_1 = _add_up($sin[1]*2) + _add_up($sin[3]*2) + _add_up($sin[5]*2) + _add_up($sin[7]*2);
    my $step_2 = $sin[0] + $sin[2] + $sin[4] + $sin[6];
    my $result = $step_1 + $step_2;
    
    if ($result%10 == 0)
    {
        return (($sin[8] == 0)?(1):(0));
    }
    else
    {
        return (($sin[8] == (10-$result%10))?(1):(0));
    }
}    

=head2 format

This method accepts Social Insurance number and returns formatted as three groups of three digits.
e.g. 123456789 would become 123-456-789. 

=cut

sub format 
{
    my $sin = shift;
    if (validate($sin))
    {
		return $sin if (length($sin) > 9);
        my @sin = split(//,$sin);
        return sprintf("%s%s%s %s%s%s %s%s%s", 
            $sin[0],$sin[1],$sin[2],
            $sin[3],$sin[4],$sin[5],
            $sin[6],$sin[7],$sin[8]);
    }
    return;
}

sub _add_up
{
    my $number = shift;
    return 0 unless defined $number;
    
    my $sum = 0;
    foreach (split(//,$number))
    {
        $sum += $_;
    }
    return $sum;
}

=head1 AUTHOR

Mohammad S Anwar, C<< <mohammad.anwar at yahoo.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-algorithm-sin at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Algorithm-SIN>.  
I will be notified, and then you'll automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Algorithm::SIN

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Algorithm-SIN>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Algorithm-SIN>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Algorithm-SIN>

=item * Search CPAN

L<http://search.cpan.org/dist/Algorithm-SIN/>

=back

=head1 LICENSE AND COPYRIGHT

Copyright 2011 Mohammad S Anwar.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

=head1 DISCLAIMER

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

=cut

1; # End of Algorithm::SIN