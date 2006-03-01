#!perl
use strict;

use Test::More tests => 15;

use FindBin;
use File::Spec;
use lib File::Spec->catfile($FindBin::Bin, 'lib');

use HTML::Truncate;

my $ht;

ok( $ht = HTML::Truncate->new(),
    "HTML::Truncate->new()" );

isa_ok( $ht, 'HTML::Truncate' );

ok( $ht->ellipsis() eq '&#8230;',
    "Ellipsis defaults properly");

diag ( 'Ellipsis: "' . $ht->ellipsis() . '"' );

ok( $ht->utf8(1), "Set utf8 flag" );

ok( $ht->utf8(), "Get utf8 flag" );

ok( $ht->ellipsis() eq chr(8230),
    "Ellipsis defaults properly" );

diag( 'Ellipsis: "' . $ht->ellipsis() . '"' );

ok( $ht->utf8(undef), "Unset utf8 flag" );

ok( ! $ht->utf8(), "Check utf8 flag is 'off'" );

my $html = join('', <DATA>);

ok( $ht->chars() == 100,
    "Chars is defaulting properly" );

ok( $ht->chars(10),
    "Setting chars to 10" );

ok( $ht->chars() == 10,
    "Chars is reset to 10" );

ok( $ht->utf8(1) );

ok( $ht->truncate($html), "Truncating HTML" );
diag( $ht->{_renewed} );

ok( $ht->percent('52%'), "Setting percentage to 52\%" );

my $renewed;
ok( $renewed = $ht->truncate($html), "Truncating" );


__DATA__
<a href="/yo-ho/blow/the/man.down"><img src="/img/whatever.png" alt="Whatever"
title="Whatever" name="Whatever" class="whatever" /></a>

<div id="piece">

<h2>About  the   &#147;author&#148;</h2>

<div id="whatever">
<p>
  <span class="date">
    11/20/2003
  </span>
  <b>Tags to <i>test</i> and check <tt>and</tt> such</b>.
</p>

<p>
  I think we can do this in a pretty straightforward fashion otherwise.
</p>

<p>
  It&#8217;s <a href="/wherever.html">a link</a> along with <a
     href="http://whatever.com/feat/embraces/why-i-took-the-pen-name.html">this</a>.
  I dislike <a
href="/wherever/20020403.html">formatting dummy <acronym title="hurtful, terrible, mean language">HTML</acronym></a>.
  15<span class="ord">th</span> generation Americans are sometimes decent fellows though gentlemen may differ.
</p>

<blockquote>
<p>
  Now you have plenty to test.
</p>
<cite>&#8212;Moo-cow-moo</cite>
</blockquote>

<p>
  <br /><br />Something else.

</p>

</div>

</div>
