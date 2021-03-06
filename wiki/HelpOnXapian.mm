## Please edit system and help pages ONLY in the master wiki!
## For more information, please see MoinMoin:MoinDev/Translation.
##master-page:
##master-date:
#acl -All:write Default
#format wiki
#language en

Using Xapian you can dramatically improve the performance of searching in moin and furthermore unlock some more features (see the search prefixes above) not possible with the legacy search engine.

<<TableOfContents>>

= Setting it up =

== Requirements ==

You must have Xapian itself and its Python bindings (xapian-core and xapian-bindings) from http://www.xapian.org/ at least in version 1.0.0 installed.

To process attachment files, moin uses `filter` plugins - here is the list of filter plugins included:

|| '''File type''' || '''Dependency''' || '''Notes''' ||
|| Text files (.txt) || - || tries utf-8 and iso-8859-15 encodings (or forces to ASCII if those do not work) ||
|| JPEG images (.jpg) || - || EXIF data is extracted ||
|| Open Office files (.sx?) || - || e.g. from older `OpenOffice.org/StarOffice` versions ||
|| Open Document files (.od?) || - || e.g. from recent `OpenOffice.org/StarOffice` versions ||
|| Binary files || - || moin uses a `strings` like filter to process those, as well as a blacklist with stuff you don't want to search ||
|| MS Word files (.doc) || antiword || filter calls `antiword` ||
|| MS Excel files (.xls) || catdoc || filter calls `xls2csv` ||
|| PDF files (.pdf) || xpdf-utils || filter calls `pdftotext` ||

After installing additional filters (or dependencies) you should (re)build your index. Xapian will find the new filters / support packages automagically. The next time your search results may contain results linking directly to your attachments. 

== Configuration ==

In your wikiconfig, you have several options on how to configure Xapian:

|| xapian_search || `False` || if True, enables Xapian search ||
|| xapian_index_dir || `None` || if set, set and use a separate index directory for every wiki distinguished by wikiname; useful for wikifarms to seperate indices (note: needs rebuilding the index) ||
|| xapian_index_history || `True` || if True, it will instruct the indexer to index all revisions of a page to let users search in their history (note: needs rebuilding the index) ||
|| xapian_stemming || `False` || if True, enables stemming of terms in Xapian (note: needs rebuilding the index) ||

 * '''xapian_search''' (default: False)
  Setting this to True, enables Xapian search for your MoinMoin wiki.

  (!) Moin will auto disable xapian_search (and fall back to slow search) if it doesn't find a usable index. You can see whether it uses Xapian on SystemInfo.

 * '''xapian_index_history''' (default: False)
  If this option is enabled, all revisions of all pages (except underlay, of which only one revision is available) are indexed. This allows users to search in older revisions of pages if enabled in the search dialogue on FindPage.
  /!\ You need to rebuild your index if you change this option. Also check the size of your index after build if you're running a big wiki as this feature can eat up a lot of disk space. Creating the index might take rather long, if indexing history is enabled.

 * '''xapian_index_dir''' (default: None)
  This option lets you specifiy a separate directory to save your index to. Initially, it gets saved to ''data_dir''/cache/xapian/. Furthermore, if this option is used, every wiki on a wikifarm gets its own index identified by it's wikiname as opposed to a single index in standard configuration. Set this option if running a wikifarm!
  /!\ Don't forget to (re-)build an/the index/indices after enabling this!

 * '''xapian_stemming''' (default: True)
  If enabled, words will be indexed in their raw and stemmed forms and terms in your search query are stemmed in your language. This means that searching for "testing" will also yield pages containing the words "tested", "tester" etc.
  /!\ Enabling/disabling this option needs a complete rebuild of your index!

== (Re-)Building an index ==

You can use the supplied command line tool ''moin'' to initially build, completely rebuild and update an existing index.

To build your index the first time, execute
{{{
moin --config-dir=/where/your/configdir/is --wiki-url=wiki-url/ index build --mode=add
}}}
in your command line. You can check the status of Xapian and its index on SystemInfo.

Moreover, the following modes can be passed to the command above to control the building of the index:

 * '''add'''
  Items are added without checking if they are already in the index. Only use this mode if you haven't got an index already.

 * '''rebuild'''
  Before going into ''add'' mode, this option deletes the previous index, if existing.

 * '''update'''
  Updates every page in the index based on it's last modification date.
  (!) Periodic invocations using this mode are '''not''' necessary as pages in the index will of course be updated upon change. This should only be used for debugging purposes if pages in the index are not up-to-date.

/!\ Please note that you '''must''' ''rebuild'' your index if you change at least one of xapian_index_history, xapian_index_dir or xapian_stemming configuration options!

== Testing ==

You can test if Xapian is enabled and if an index is available by checking SystemInfo. To check if searches are performed using Xapian, enable show_timings in your wikiconfig, perform a search and look for _xapianSearch on the bottom of the page.

= Usage =

Xapian is basically used the same way as all other search engines. Due to Xapian's advanced features some new search term prefixed were introduced which are not already available in the legacy search engine (commonly referred to as moin search). See HelpOnSearching for more information and/or use the new advanced search dialogue available on FindPage to see what's available and possible.
