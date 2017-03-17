use Test::More;

require MooX::LazierAttributes;

run_test(
    args => [ 'ro' ],
    expected => {
		is => 'ro',
	},
    name => 'construct_attributes a ro attribute' ,
);

run_test(
    args => [ 'rw', ],
    expected => {
		is => 'rw',
	},
    name => 'construct_attributes a rw attribute' ,
);

run_test(
    args => ['rw', undef, { 'builder' => 1, } ],
    expected => {
		is => 'rw',
		builder => 1,
	},
    name => 'construct_attributes a rw attribute with a builder',
);

run_test(
    args => ['ro', undef, { required => 1 } ],
    expected => {
		is => 'ro', 
		required => 1,
	},
    name => 'construct_attributes a ro attribute that is required',
);

sub run_test {
    my %test = @_;
    return is_deeply( {&MooX::LazierAttributes::construct_attribute(@{ $test{args} })}, $test{expected}, "$test{name}");
}

done_testing();
