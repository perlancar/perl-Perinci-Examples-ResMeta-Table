package Perinci::Examples::ResMeta::Table;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our %SPEC;

$SPEC{':package'} = {
    v => 1.1,
    summary => 'Demonstrate the various table and table.* '.
        'result metadata property/attributes',
};

our %Examples = (
    fields1 => {
        summary => 'table.fields',
        result => [
            200, "OK",
            [
                ['andi', 'male', 25],
                ['budi', 'male', 33],
                ['cinta', 'female', 21],
                ['denias', 'male', 13],
            ],
            {
                'table.fields' => [qw/name gender age/],
            },
        ],
    },
    field_format_percent => {
        summary => 'field format: percent',
        result => [
            200, "OK",
            [
                ['andi', 0.65],
                ['budi', 0.30],
                ['cinta', 0.05],
            ],
            {
                'table.fields' => [qw/name share/],
                'table.field_formats' => [undef, [percent => {sprintf=>'%.0f%%'}]],
            },
        ],
    },
    field_format_iso8601_date => {
        summary => 'field format: iso8601_date',
        result => [
            200, "OK",
            [
                ['kiss land', 1378746000], # 2013-09-10
                ['beauty behind the madness', 1440694800], # 2015-08-28
                ['starboy', 1480006800], # 2016-11-25
            ],
            {
                'table.fields' => [qw/title release_date/],
                'table.field_formats' => [undef, 'iso8601_date'],
            },
        ],
    },
    field_format_iso8601_datetime => {
        summary => 'field format: iso8601_datetime',
        result => [
            200, "OK",
            [
                ['kiss land', 1378746001], # 2013-09-10 + 1sec
                ['beauty behind the madness', 1440694802], # 2015-08-28 + 2sec
                ['starboy', 1480006803], # 2016-11-25 + 3sec
            ],
            {
                'table.fields' => [qw/title release_date/],
                'table.field_formats' => [undef, 'iso8601_datetime'],
            },
        ],
    },
    field_format_number => {
        summary => 'field format: number',
        result => [
            200, "OK",
            [
                map {[map {rand()*100_000+1} 1..3]} 1..7
            ],
            {
                'table.fields' => [map {"num$_"} 1..3],
                'table.field_formats' => [
                    [number => {precision=>0}],
                    [number => {precision=>2}],
                    [number => {precision=>4}],
                ],
                'table.field_aligns' => [map {"right"} 1..3],
            },
        ],
    },
);

1;
# ABSTRACT:

=head1 DESCRIPTION

See the source code.


=head1 SEE ALSO

L<Perinci::Examples>

L<Perinci::Sub::Property::result::table>

L<Perinci::Result::Format::Lite>
