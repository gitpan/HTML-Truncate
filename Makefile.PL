use strict;
use inc::Module::Install;

name "HTML-Truncate";

all_from "lib/HTML/Truncate.pm";

# requires "perl" => 5.8;
# requires "HTML::TreeBuilder" => 3;
requires "HTML::Tagset" => 3;
requires "HTML::TokeParser" => 2;
requires "List::Util" => 1;
    
build_requires "Test::More" => 0.5;
build_requires "File::Spec" => 0;

auto_install;
WriteAll;

__END__
