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

    say {name => 'Jim', age => 34}->to_json;
    # {"name":"Jim","age":46}
    
    my $person = '{"name":"Jim","age":46}'->from_json
    # {name => 'Jim', age => 34}

    my $serialized_person = $person->to_json;
    # {"name":"Jim","age":46}
    
    # works on arrays too
    [1, 2, 3, 4, 5]->to_json;

=head1 METHODS

=head2 to_json 

This method behaves the same as the function defined in C<JSON>.

=head2 from_json

This method behaves the as the function defined in C<JSON>. 

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

package autobox::JSON::Ref;
require JSON;
sub to_json { JSON::to_json(shift); }

1;
