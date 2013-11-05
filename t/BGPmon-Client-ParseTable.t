# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl BGPmon-Client.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test::More;
BEGIN { 
	our $VERSION = 1.02;
#	use_ok('BGPmon::Client::ParseTable') 
};
use_ok('BGPmon::Client::ParseTable');

require_ok('XML::Parser');
require_ok('XML::Simple');
#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my $xml_string = '<BGP_MESSAGE length="00002117" version="0.4" xmlns="urn:ietf:params:xml:ns:xfb-0.4" type_value="260" type="TABLE"><BGPMON_SEQ id="1339464303" seq_num="1499028916"/><TIME timestamp="1313093281" datetime="2011-08-11T20:08:01Z" precision_time="606"/><PEERING as_num_len="2"><SRC_ADDR><ADDRESS>129.82.138.6</ADDRESS><AFI value="1">IPV4</AFI></SRC_ADDR><SRC_PORT>4321</SRC_PORT><SRC_AS>6447</SRC_AS><DST_ADDR><ADDRESS>195.209.15.251</ADDRESS><AFI value="1">IPV4</AFI></DST_ADDR><DST_PORT>179</DST_PORT><DST_AS>5568</DST_AS><BGPID>0.0.0.0</BGPID></PEERING><ASCII_MSG length="70"><MARKER length="16">FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF</MARKER><UPDATE withdrawn_len="0" path_attr_len="39"><WITHDRAWN count="0"/><PATH_ATTRIBUTES count="6"><ATTRIBUTE length="1"><FLAGS transitive="TRUE"/><TYPE value="1">ORIGIN</TYPE><ORIGIN value="0">IGP</ORIGIN></ATTRIBUTE><ATTRIBUTE length="4"><FLAGS transitive="TRUE"/><TYPE value="3">NEXT_HOP</TYPE><NEXT_HOP>195.209.15.251</NEXT_HOP></ATTRIBUTE><ATTRIBUTE length="0"><FLAGS transitive="TRUE"/><TYPE value="6">ATOMIC_AGGREGATE</TYPE><ATOMIC_AGGREGATE/></ATTRIBUTE><ATTRIBUTE length="6"><FLAGS optional="TRUE" transitive="TRUE"/><TYPE value="7">AGGREGATOR</TYPE><AGGREGATOR><AS>3325</AS><ADDR>4.21.192.19</ADDR></AGGREGATOR></ATTRIBUTE><ATTRIBUTE length="4"><FLAGS optional="TRUE" transitive="TRUE"/><TYPE value="8">COMMUNITIES</TYPE><COMMUNITIES><COMMUNITY><AS>5568</AS><VALUE>5049</VALUE></COMMUNITY></COMMUNITIES></ATTRIBUTE><ATTRIBUTE length="6"><FLAGS transitive="TRUE"/><TYPE value="2">AS_PATH</TYPE><AS_PATH><AS_SEG type="AS_SEQUENCE" length="2"><AS>5568</AS><AS>3325</AS></AS_SEG></AS_PATH></ATTRIBUTE></PATH_ATTRIBUTES><NLRI count="2"><PREFIX><ADDRESS>193.232.252.0/23</ADDRESS><AFI value="1">IPV4</AFI><SAFI value="1">UNICAST</SAFI></PREFIX><PREFIX><ADDRESS>194.85.240.0/21</ADDRESS><AFI value="1">IPV4</AFI><SAFI value="1">UNICAST</SAFI></PREFIX></NLRI></UPDATE></ASCII_MSG><OCTET_MSG><OCTETS length="70">FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0046020000002740010100400304C3D10FFB400600C007060CFDC255F5C6C0080415C013B9400206020215C00CFD17C1E8FC15C255F0</OCTETS></OCTET_MSG></BGP_MESSAGE>';



# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.
my $parser = new BGPmon::Client::ParseTable();
$parser->output_file("test_file");
ok($parser->summarize_tables(),"Return cleanly on undef");
ok($parser->summarize_tables($xml_string),"Parse the given string");
ok(BGPmon::Client::ParseTable::summarize_tables($parser,$xml_string),"Parse the given string");
#ok(-e "test_file","The test file exists");

done_testing();


