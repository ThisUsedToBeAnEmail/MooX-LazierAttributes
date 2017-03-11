package MooX::LazierAttributes;

use strict;
use warnings;
use Scalar::Util qw/reftype blessed/;
use MooX::ReturnModifiers qw/return_modifiers/;

our $VERSION = '0.06';

use constant ro => 'ro';
use constant rw => 'rw';
use constant nan => undef;
use constant lzy => ( lazy => 1 );
use constant bld => ( builder => 1 );
use constant lzy_bld => ( lazy_build => 1 );
use constant trg => ( trigger => 1 );
use constant clr => ( clearer => 1 );
use constant req => ( required => 1 );

our @EXPORT = qw/$ro $rw/;

sub import {
    my $target = caller;
    my %modifiers = return_modifiers($target);
        
    {
        no strict 'refs';
        ${"${target}::"}{$_} = ${__PACKAGE__."::"}{$_} 
        foreach ( qw/ro rw nan lzy bld lzy_bld trg clr req/ );
    }

    my $attributes = sub {
        my %attr = @_;
        while ( my ($name, $spec) = each %attr) {
            $modifiers{has}->($name, construct_attribute($spec));
        }
    };

    { no strict 'refs'; *{"${target}::attributes"} = $attributes; }

    return 1;
}

sub construct_attribute {
    my $spec = shift;
    my %attr = ();
    $attr{is} = $spec->[0];
    $attr{default} = sub { _clone($spec->[1]) } if defined $spec->[1];
    map { $attr{$_} = $spec->[2]->{$_} } keys %{ $spec->[2] };
    return %attr;
}

sub _clone {
    my ($to_clone) = @_;

    my $blessed = blessed $to_clone;
    my $clone    = _deep_clone($to_clone);
    return $blessed ? bless $clone, $blessed : $clone;
}

sub _deep_clone {
    my ($to_clone) = @_;
    if ( reftype( \$to_clone ) eq 'SCALAR' ) {
        return $to_clone;
    }
    elsif ( reftype($to_clone) eq 'HASH' ) {
        return { map +( $_ => _clone( $to_clone->{$_} ) ), keys %$to_clone };
    }
    elsif ( reftype($to_clone) eq 'ARRAY' ) {
        return [ map _clone($_), @$to_clone ];
    }
    return $to_clone;
}

1;

__END__


=head1 NAME

MooX::LazierAttributes - Lazier Attributes.

=head1 VERSION

Version 0.06

=cut

=head1 SYNOPSIS

    package Hello::World;
    
    use Moo;
    use MooX::LazierAttributes;

    attributes (
        one   => [ro],
        two   => [ro, {}],
        three => [rw, My::Thing->new(), { lzy, clr }]
    );

    .....

    my $hello = Hello::World->new({ 
        one => 1,
        two => { three => 'four' },   
    });

    $hello->one;    # 1
    $hello->two;    # { three => 'four' }
    $hello->three;  # $obj

=head1 EXPORT

=head2 attributes

=head1 Constants

=head3 ro

'ro'

=head3 rw

'rw'

=head3 nan

undef

=head3 lzy;

( lazy => 1 )

=head3 bld

( builder => 1 )

=head2 lzy_bld 

( lazy_build => 1 ),

=head2 trg

( tigger => 1 ),

=head2 req

( required => 1 ),

=head1 Maybe in the future

lzy_bld_hash

( lazy => 1, builder => 1 ) .... sub _build_thing { return { } }

=head1 AUTHOR

Robert Acock, C<< <thisusedtobeanemail at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-moox-lazierattributes at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=MooX-LazierAttributes>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc MooX::LazierAttributes

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=MooX-LazierAttributes>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/MooX-LazierAttributes>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/MooX-LazierAttributes>

=item * Search CPAN

L<http://search.cpan.org/dist/MooX-LazierAttributes/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2017 Robert Acock.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


=cut

1; # End of MooX::LazierAttributes
