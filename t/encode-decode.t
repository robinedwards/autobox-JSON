use strict;
use warnings;
use Test::More;
require_ok 'autobox::JSON';
use autobox::JSON;

is {name => 'Jim', age => 46}->encode_json, '{"name":"Jim","age":46}', "hash to json";

my $hash = { name => 'Jim', age => 46};

is $hash->encode_json, '{"name":"Jim","age":46}', "hash to json";

is $hash->encode_json_pretty,
'{
   "name" : "Jim",
   "age" : 46
}
', "hash to pretty json";

is [1,2,3,4]->encode_json, '[1,2,3,4]', "array to json";

my $array = [1,2,3,4];

is $array->encode_json, '[1,2,3,4]', "array to json";

is_deeply q|{"name":"Jim","age":46}|->decode_json,
    {name => 'Jim', age => 46}, "q string to json";

is_deeply '{"name":"Jim","age":46}'->decode_json,
    {name => 'Jim', age => 46}, "string to json";

my $str = '{"name":"Jim","age":46}';

is_deeply $str->decode_json, {name => 'Jim', age => 46}, "string to json";

done_testing();
