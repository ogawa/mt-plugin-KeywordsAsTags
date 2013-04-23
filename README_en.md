# KeywordsAsTags Plugin

Converts keywords to MT3.3 tags when posting an entry with keywords.

## Changes

 * 0.01 (2006-07-16 23:52:17 +0900):
   * First release.
 * 0.02 (2007-08-31 12:27:38 +0900):
   * Now support MT 4.0.
   * Add localized plugin description.

## Overview

Now Movable Type 3.3 supported tagging features natively. But, existing XMLRPC/AtomPP-based blogging tools such as ecto and MarsEdit cannot employ tagging, because they don't recognize how to add tags to entries via XMLRPC or AtomPP at this moment.

To make it possible to posting entries with tags, KeywordsAsTags Plugin provides the feature to convert 'entries with keywords' to 'entries with tags' automatically.  So it can work as an adapter for tag-disabled blogging tools!

Current version of KeywordsAsTags plugin supports only keywords-to-tags ('one way') conversion.  So, if you change tags for an entry from Movable Type entry editting screen, its keywords are never changed.

## Installation

To install this plugin, upload or copy 'KeywordsAsTags' directory into your Movable Type's plugin directory.  After proper installation, you will see a new "KeywordsAsTags <version number>" listed on the Main Menu of your Movable Type.

After that, MT converts keywords to tags everytime you post entries.

## Tag Format

KeywordsAsTags Plugin automatically interprets the string which inputs the keywords field of the entry, as "tags". Any strings enclosed by brackets([,]), sigle and double quotes are parsed as a single tag. And any strings separated by delimiter characters(;,|) are parsed as a single tag. And if no delimiter characters appear, whitespaces work as delimter.

The following all examples are recognized as two tags "Movable Type" and "Plugin":

    "Movable Type" Plugin
    Movable Type, Plugin
    Movable Type|Plugin|
    [Movable Type][Plugin]

And the following example is parsed as two tags "MT" and "Plugin":

    MT Plugin

## See Also

## License

This code is released under the Artistic License. The terms of the Artistic License are described at [http://www.perl.com/language/misc/Artistic.html](http://www.perl.com/language/misc/Artistic.html).

## Author & Copyright

Copyright 2006, Hirotaka Ogawa (hirotaka.ogawa at gmail.com)
