use Test::More;

use t::odea::BasicAttributes;

use lib '.';

my $basics = t::odea::BasicAttributes->new;

is($basics->one, 10, 'okay we got 10');
is_deeply($basics->two, [qw/one two three/], 'is deeply');
is_deeply($basics->three, { one => 'two' }, 'is deeply');
is($basics->four, 'a default value', 'a default value');
isa_ok($basics->five, 'Thing');
is($basics->six, 0, "a false value");
is($basics->seven, undef, "undef value");
is($basics->eight, undef, "undef value");
is_deeply($basics->nine, { 'broken' => 'thing' }, 'fix my broken code');
is_deeply($basics->ten, {}, 'fix my broken code');

done_testing();
