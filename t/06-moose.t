use strict;
use warnings;
use Test::More;
{

    package Foo;
    use Moose;
    use MooX::LazierAttributes;
    attributes( 
        foo => [ ro, { one => 'two' } ],
        boo => [ rw, sub { 'Hey' } ],
    );
}

my $o1 = Foo->new;
is_deeply( $o1->foo, { one => 'two' }, 'is deeply hashref { one => "two" }');
is($o1->boo, 'Hey', "expected Hey");
ok($o1->boo('set boo'), 'boo is rw so try a set');
is($o1->boo, 'set boo', 'boo can be set');

done_testing;
