use 5.14.0;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'BGPmon::Client',
    VERSION_FROM      => 'lib/BGPmon/Client.pm', # finds $VERSION
    PREREQ_PM         => {	'XML::Parser'	=> 0,
                    				'XML::Simple'	=> 0,
                            'Getopt::Long' => 0,
                            'IO::Select' => 0,
                            'IO::Socket' => 0,
                            'Carp' => 0,


}, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/BGPmon/Client.pm', # retrieve abstract from module
       AUTHOR         => 'Catherine Olschanowsky <cathie@cs.colostate.edu>') : ()),
);
