package t::odea::BasicTypes;

use Moo;
use MooX::LazierAttributes;
use Types::Standard qw/Str HashRef ArrayRef/;

has thing => (
    is_rw,
    isa => Str,
);

has why => (
    is_ro,
    isa => HashRef,
);

has care => (
    is_ro,
    isa => ArrayRef,
);

=pod

    package Stricter::World

    use MooX::Unknown;

    attributes (
        open  => [ Str ],
        close => [ HashRef, { bld } ],
    );

    validate_subs (
        defense => {
            params => {
                one => [ Str, { default => 'okay' } ],
                two => [ Hashref, { bld } ],
                three => [ ArrayRef ],
            },
            returns => {
                one => [ Str ],
                two => [ Hashref ],
                three => [ ArrayRef ],
                four => [ Str ],
            }
        } 
    );
    
    sub defense {
        my ($self, %args) = @_;
        $args{four} = 'logical';
        return %args;
    }

=cut

1;
