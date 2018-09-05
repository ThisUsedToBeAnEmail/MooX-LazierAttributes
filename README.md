# NAME

MooX::LazierAttributes - Lazier Attributes, well It lets me type 'has', 'is', 'default' less.
========================
[![Build Status](https://travis-ci.org/ThisUsedToBeAnEmail/MooX-LazierAttributes.png?branch=master)](https://travis-ci.org/ThisUsedToBeAnEmail/MooX-LazierAttributes)
[![Coverage Status](https://coveralls.io/repos/ThisUsedToBeAnEmail/MooX-LazierAttributes/badge.png?branch=master)](https://coveralls.io/r/ThisUsedToBeAnEmail/MooX-LazierAttributes?branch=master)
[![CPAN version](https://badge.fury.io/pl/MooX-LazierAttributes.svg)](https://metacpan.org/pod/MooX-LazierAttributes)


# VERSION

Version 0.01

# SYNOPSIS

    use MooX::LazierAttributes;

    attributes (
        one   => ['ro'],
        two   => ['ro', {}],
        three => ['rw', $obj { clearer => 1 }]
    );

# EXPORT

## attributes

# AUTHOR

Robert Acock, `<thisusedtobeanemail at gmail.com>`

# BUGS

Please report any bugs or feature requests to `bug-moox-lazierattributes at rt.cpan.org`, or through
the web interface at [http://rt.cpan.org/NoAuth/ReportBug.html?Queue=MooX-LazierAttributes](http://rt.cpan.org/NoAuth/ReportBug.html?Queue=MooX-LazierAttributes).  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

# SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc MooX::LazierAttributes

You can also look for information at:

- RT: CPAN's request tracker (report bugs here)

    [http://rt.cpan.org/NoAuth/Bugs.html?Dist=MooX-LazierAttributes](http://rt.cpan.org/NoAuth/Bugs.html?Dist=MooX-LazierAttributes)

- AnnoCPAN: Annotated CPAN documentation

    [http://annocpan.org/dist/MooX-LazierAttributes](http://annocpan.org/dist/MooX-LazierAttributes)

- CPAN Ratings

    [http://cpanratings.perl.org/d/MooX-LazierAttributes](http://cpanratings.perl.org/d/MooX-LazierAttributes)

- Search CPAN

    [http://search.cpan.org/dist/MooX-LazierAttributes/](http://search.cpan.org/dist/MooX-LazierAttributes/)

# ACKNOWLEDGEMENTS

# LICENSE AND COPYRIGHT

Copyright 2017 Robert Acock.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

[http://www.perlfoundation.org/artistic\_license\_2\_0](http://www.perlfoundation.org/artistic_license_2_0)

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
