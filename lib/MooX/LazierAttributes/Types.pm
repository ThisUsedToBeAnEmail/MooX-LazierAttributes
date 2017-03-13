package MooX::LazierAttributes::Types;

use Type::Tiny;
# use Type::Standard

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
