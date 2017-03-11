package t::odea::BasicAttributes;

use Moo;
use MooX::LazierAttributes;

attributes (
    one      => [ 'rw', 10 ],    
    two      => [ ro, [qw/one two three/] ],    
    three    => [ 'ro', { one => 'two' } ],    
    four     => [ 'ro', 'a default value' ],
    five     => [ 'ro', bless {}, 'Thing' ],
    six      => [ 'ro', 0 ],
    seven    => [ 'ro', undef ],
    eight    => [ 'rw' ],
    nine     => [ ro, { broken => 'thing' }, { lzy } ],
    ten      => [ 'rw', {}],
    [qw/eleven twelve thirteen/] => [ro, 'test this'],
);

1;
