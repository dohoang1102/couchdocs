#redirect Release_procedure
== Making a Release ==

=== Checklist ===

 1. Update the `README` file with important information.
 2. Update the `NEWS` and `CHANGES` files with important information.
 3. Update the `acinclude.m4` file with version information.
 4. Update the `config.*` helper files.

=== Preparing the Release ===

{{{
repos="https://svn.apache.org/repos/asf/incubator/couchdb"

svn cp $repos/trunk $repos/branches/Y.Y.x
svn cp $repos/branches/Y.Y.x $repos/tags/Y.Y.Y
svn export $repos/tags/Y.Y.Y export
}}}

You must then use the `export` directory to prepare the release.

To build the source for distribution you should then run the following command:

{{{
./bootstrap && ./configure && make distsign
}}}

If everything was successful you should see the following files
sitting in the `export` directory ready for distribution:

 * apache-couchdb-Y.Y.Y.tar.gz
 * apache-couchdb-Y.Y.Y.tar.gz.asc
 * apache-couchdb-Y.Y.Y.tar.gz.md5
 * apache-couchdb-Y.Y.Y.tar.gz.sha

Upload these to your `public_html` directory on `people.apache.org` and make sure they are world readable.

=== Calling a Vote ===

Call a vote on the [[http://mail-archives.apache.org/mod_mbox/incubator-couchdb-dev/|couchdb-dev]] mailing list:

  * [[http://mail-archives.apache.org/mod_mbox/incubator-couchdb-dev/200806.mbox/%3c20080616232144.GA23300@bytesexual.org%3e|example couchdb-dev vote]]
  * [[http://mail-archives.apache.org/mod_mbox/incubator-couchdb-dev/200806.mbox/%3c20080620131433.GA17003@bytesexual.org%3e|example couchdb-dev vote results]]

Call a vote on the [[http://mail-archives.apache.org/mod_mbox/incubator-general/|incubator-general]] mailing list:

 * [[http://mail-archives.apache.org/mod_mbox/incubator-general/200806.mbox/%3c20080620143738.GC17003@bytesexual.org%3e|example incubator-general vote]]
 * [[http://mail-archives.apache.org/mod_mbox/incubator-general/200806.mbox/%3c20080624185615.GC27744@bytesexual.org%3e|example incubator-general vote results]]

=== Making the Release ===

 * Copy the release directory to `/www/www.apache.org/dist/incubator/couchdb` on `people.apache.org`.
 * Update http://incubator.apache.org/couchdb/downloads.html
 * Make a release announcement to the [[http://mail-archives.apache.org/mod_mbox/www-announce/|www-announce]] and [[http://mail-archives.apache.org/mod_mbox/incubator-couchdb-user/|incubator-couchdb-user]] mailing list:
   * [[http://mail-archives.apache.org/mod_mbox/www-announce/200806.mbox/%3C20080625173452.GA14650@bytesexual.org%3E|example release announcement]]

== Useful Resources ==

 * http://incubator.apache.org/incubation/Incubation_Policy.html
 * http://incubator.apache.org/guides/releasemanagement.html
 * http://www.apache.org/dev/release-download-pages.html
 * http://incubator.apache.org/whoweare.html
