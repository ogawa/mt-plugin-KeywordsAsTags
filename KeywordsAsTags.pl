# KeywordsAsTags - converts keywords to tags when posting an entry with keywords (experimental plugin)
#
# $Id$

package MT::Plugin::KeywordsAsTags;
use strict;
use MT;
use base qw(MT::Plugin);
our $VERSION = '0.01';

my $plugin = __PACKAGE__->new({
    name => 'KeywordsAsTags Plugin',
    description => 'A plugin for converting keywords to MT3.3 tags when posting an entry with keywords.',
    doc_link => 'http://code.as-is.net/wiki/KeywordsAsTags_Plugin',
    author_name => 'Hirotaka Ogawa',
    author_link => 'http://profile.typekey.com/ogawa/',
    version => $VERSION,
});
MT->add_plugin($plugin);
MT->add_callback('MT::Entry::post_save', 5, $plugin, \&keywords_as_tags);

sub keywords_as_tags {
    my ($eh, $app, $e) = @_;
    return unless $e->isa('MT::Entry') && $e->keywords;
    my @tags = split_tags($e->keywords, 1);
    return unless scalar @tags;

    $e->set_tags(@tags);
    $e->save_tags;
}

sub split_tags {
    my ($string, $case_sensitive) = @_;
    return unless $string;
    my @tags;
    $string =~ s/\#.*$//g;
    $string =~ s/(^\s+|\s+$)//g;
    $string = lc $string unless $case_sensitive;
#    $string =~ s/\[[^[]+\]//g; # uncomment this to discard [short title]

    if ($string =~ m/[;,|]/) {
	# tags separated by non-whitespaces
	while ($string =~ m/(\[[^]]+\]|"[^"]+"|'[^']+'|[^;,|]+)/g) {
	    my $tag = $1;
	    $tag =~ s/(^[\["'\s;,|]+|[\]"'\s;,|]+$)//g;
	    push @tags, $tag if $tag;
	}
    } else {
	# tags separated by whitespaces
	while ($string =~ m/(\[[^]]+\]|"[^"]+"|'[^']+'|[^\s]+)/g) {
	    my $tag = $1;
	    $tag =~ s/(^[\["'\s]+|[\]"'\s]+$)//g;
	    push @tags, $tag if $tag;
	}
    }
    @tags;
}

1;
