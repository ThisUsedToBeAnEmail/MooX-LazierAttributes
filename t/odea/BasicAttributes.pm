package t::odea::BasicAttributes;

use Moo;
use MooX::LazierAttributes;

use Test::MockObject;
(my $obj = Test::MockObject->new->set_always( echo => 'one two three' ))->set_isa('Thing');

attributes (
    one      => [ 'rw', 10 ],    
    two      => [ 'ro', [qw/one two three/] ],    
    three    => [ 'ro', { one => 'two' } ],    
    four     => [ 'ro', 'a default value' ],
    five     => [ 'ro', $obj ],
    six      => [ 'ro', 0 ],
    seven    => [ 'ro', undef ],
    eight    => [ 'rw' ]
);


1;
