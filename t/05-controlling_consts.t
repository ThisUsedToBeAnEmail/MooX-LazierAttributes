use strict;
use warnings;
use Test::More;

use Test::Requires qw/
    Moo
/;

{

    package Test::Control;
    use Moo;
    use MooX::LazierAttributes qw/ro/;
    attributes( foo => [ ro, {} ], );
}

my $o1 = Test::Control->new( foo => { a => 'b' } );
is_deeply($o1->foo, { a => 'b' }, "foo is deeply { a => 'b' }");

eval '
{
    package Test::Control::Death;
    use Moo;
    use MooX::LazierAttributes qw/ro/;
    attributes( foo => [ rw, {} ], );
}
';
my $error = $@;
like $error, qr/Bareword "rw" not allowed while "strict subs"/, "and we error - $error";

done_testing;
