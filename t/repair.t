#!perl
use strict;

use Test::More tests => 11;

use HTML::Truncate;

my $ht;

my $cases = {
    '<b><i>foobar</i></b>' => '<b><i>foobar</i></b>',
    'foo</i>bar' => 'foobar',
    '<b><i>foobar</b>' => '<b><i>foobar</i></b>',
    '<b><i>foobar</b></i>' => '<b><i>foobar</i></b>',
    '<b><u><i>foobar</b></i> quux' => '<b><u><i>foobar</i></u></b> quux',
    '<p><b><u><i>foobar</b><hr /> quux</p>' => '<p><b><u><i>foobar</i></u></b><hr /> quux</p>',
};

ok( $ht = HTML::Truncate->new(), "HTML::Truncate->new()" );

isa_ok( $ht, 'HTML::Truncate' );

ok( !$ht->repair, '$ht->repair defaults properly' );
$ht->repair(1);
ok( $ht->repair, '$ht->repair(1)' );
$ht->repair(0);
ok( !$ht->repair, '$ht->repair(0)' );

$ht->repair(1);

for my $case (keys %{$cases}) {
    is( $ht->truncate($case), $cases->{$case},
        "Repaired '$case' ... '$cases->{$case}'" );
}

1;
