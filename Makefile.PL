use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'HTML::Truncate',
    AUTHOR              => 'Ashley Pond V <ashley@cpan.org>',
    VERSION_FROM        => 'lib/HTML/Truncate.pm',
    ABSTRACT_FROM       => 'lib/HTML/Truncate.pm',
    PL_FILES            => {},
    PREREQ_PM => { 
        'HTML::TokeParser' => 0,
        'HTML::Tagset' => 0,
        'Test::More' => 0,
        'Carp' => 0,
        'HTML::Entities' => 0,
        'FindBin' => 0,
        'File::Spec' => 0,
    },
    dist          => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean         => { FILES => 'HTML-Truncate-*' },
);
