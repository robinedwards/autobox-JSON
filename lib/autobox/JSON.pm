package autobox::JSON;
use 5.008;
use strict;
use warnings;

use parent 'autobox';

sub import {
    my ($class) = @_;

    $class->SUPER::import(
        HASH => 'autobox::JSON::Ref',
        ARRAY => 'autobox::JSON::Ref',
        STRING => 'autobox::JSON::String',
    );
}

=head1 NAME

autobox::JSON - bringing JSON functions to autobox

=head1 SYNOPSIS

    use autobox::JSON;

    say {name => 'Jim', age => 34}->encode_json;
    # {"name":"Jim","age":46}

    my $person = '{"name":"Jim","age":46}'->decode_json
    # {name => 'Jim', age => 34}

    my $serialized_person = $person->encode_json;
    # {"name":"Jim","age":46}

    # works on arrays too
    [1, 2, 3, 4, 5]->encode_json;

=head1 METHODS

=head2 encode_json

This method behaves the same as L<JSON/encode_json>.

=head2 decode_json

This method behaves the same as L<JSON/decode_json>.

=head2 to_json (depreciated)

This method behaves the same as L<JSON/to_json>.

This method is depreciated because the JSON documentation itself
prefers encode_json.

=head2 from_json (depreciated)

This method behaves the same as L<JSON/from_json>.

This method is depreciated as the JSON documentation itself
prefers decode_json.

=head1 SEE ALSO

C<autobox> C<JSON> C<autobox::Core>

=head1 AUTHOR

Robin Edwards, E<lt>robin.ge@gmail.comE<gt>

L<http://github.com/robinedwards/>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2011 by Robin Edwards

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.12.3 or,
at your option, any later version of Perl 5 you may have available.

=cut

package autobox::JSON::String;
require JSON;
sub from_json { JSON::from_json(shift); }
sub decode_json { JSON::decode_json(shift); }

package autobox::JSON::Ref;
require JSON;
sub to_json { JSON::to_json(shift); }
sub encode_json { JSON::encode_json(shift); }

1;
