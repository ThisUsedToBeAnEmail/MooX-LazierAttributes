use Test::More;

use t::odea::BasicTypes;
use lib '.';

my $basics = t::odea::BasicTypes->new;

ok($basics->thing('okay'));
is($basics->thing, 'okay');

eval { $basics->thing({ ohhh => 'noooo' }) };
my $error = $@;
my $expected_error = 'Reference {"ohhh" => "noooo"} did not pass type constraint "Str" (in $self->{"thing"})';
is($error->message, $expected_error, "caugt an error - ${expected_error}");

done_testing();
