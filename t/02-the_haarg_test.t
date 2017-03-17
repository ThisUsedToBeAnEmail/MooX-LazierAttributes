use strict;
use warnings;
use Test::More;
use Test::Requires qw/
    Moo
/;

{

    package Foo;
    use Moo;
    use MooX::LazierAttributes;
    attributes( foo => [ 'ro', {} ], );
}
my $o1 = Foo->new;
my $o2 = Foo->new;
$o1->foo->{foo} = 219;
is $o2->foo->{foo}, undef;
done_testing;
