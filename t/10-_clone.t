use Test::More;

require MooX::LazierAttributes;

run_test(
    args => 'one two',
    expected => 'one two',
    name => '_deep_clone a scalar',
);

run_test(
    args => { one => 'two' },
    expected => { one => 'two' },
    name => '_deep_clone a Hash',
);

run_test(
    args => [ qw/one two/ ],
    expected => [ qw/one two/ ],
    name => '_deep_clone a Array',
);

run_obj_test(
    args => (bless { one => 'two' }, 'Thing'),
    isa => 'Thing',
    key => 'one',
    expected => 'two',
    name => '_deep_clone a Array',
);

sub run_test {
    my %test = @_;
    return is_deeply( &MooX::LazierAttributes::_clone($test{args}), $test{expected}, "$test{name}");
}

sub run_obj_test {
    my %test = @_;
    
    my $new_obj = &MooX::LazierAttributes::_clone($test{args});
    isa_ok($new_obj, $test{isa});
    is($new_obj->{$test{key}}, $test{expected}, "simply check $test{key} is expected $test{expected}");
}

done_testing();
