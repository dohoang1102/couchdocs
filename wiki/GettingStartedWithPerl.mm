#redirect Getting_started_with_Perl
Getting started with Perl and the CouchDB API.

The following shows the basics of working with the raw CouchDB REST api from Perl. If you want a richer interface that more tightly maps Couch documents into Perl (so you don't have to deal with JSON manually, for example), you should pick your favourite out of the several implementations: [[http://search.cpan.org/dist/Net-CouchDb/|Net::CouchDb]] (See also [[http://git.ndrix.com/?p=Net-CouchDB|Michael Hendricks' version]]), [[http://search.cpan.org/dist/CouchDB-Client/|CouchDB::Client]], [[http://search.cpan.org/dist/AnyEvent-CouchDB/|AnyEvent::CouchDB]], [[http://search.cpan.org/~zaphar/DB-CouchDB-Schema-0.2.1/lib/DB/CouchDB/Schema.pm|DB::CouchDB::Schema]], or for POE lovers [[http://search.cpan.org/dist/POE-Component-Client-CouchDB/|POE::Component::Client::CouchDB]].

Note that these examples all use the new version of CouchDB, with a JSON interface rather than XML.

== Example Wrapper Class ==

You can save this to a file named ''CouchDB.pm'', then just use it from your program with ''use CouchDB;''. But if you're going to do anything more than mess around, I would recommend getting the Net::!CouchDb module from CPAN.

{{{
package CouchDB;

use strict;
use warnings;

use LWP::UserAgent;

sub new {
  my ($class, $host, $port, $options) = @_;

  my $ua = LWP::UserAgent->new;
  $ua->timeout(10);
  $ua->env_proxy;

  return bless {
                ua       => $ua,
                host     => $host,
                port     => $port,
                base_uri => "http://$host:$port/",
               }, $class;
}

sub ua { shift->{ua} }
sub base { shift->{base_uri} }

sub request {
  my ($self, $method, $uri, $content) = @_;

  my $full_uri = $self->base . $uri;
  my $req;

  if (defined $content) {
    #Content-Type: application/json

    $req = HTTP::Request->new( $method, $full_uri, undef, $content );
    $req->header('Content-Type' => 'application/json');
  } else {
    $req = HTTP::Request->new( $method, $full_uri );
  }

  my $response = $self->ua->request($req);

  if ($response->is_success) {
    return $response->content;
  } else {
    die($response->status_line . ":" . $response->content);
  }
}

sub delete {
  my ($self, $url) = @_;

  $self->request(DELETE => $url);
}

sub get {
  my ($self, $url) = @_;

  $self->request(GET => $url);
}

sub put {
  my ($self, $url, $json) = @_;

  $self->request(PUT => $url, $json);
}

sub post {
  my ($self, $url, $json) = @_;

  $self->request(POST => $url, $json);
}

1;
}}}

== Creating a Database ==

To create a database called ''foo'':

{{{
my $db = CouchDB->new('localhost', '5984');
$db->put("foo");
}}}

== Deleting a Database ==

To delete a database called ''foo'':

{{{
my $db = CouchDB->new('localhost', '5984');
$db->delete("foo");
}}}

== Creating a Document ==

To create a document in the database ''foo'' with the id ''document_id'':

{{{
my $db = CouchDB->new('localhost', '5984');
$db->put("foo/document_id", <<JSON);
{
 "value":
 {
   "Subject":"I like Perl",
   "Author":"Rusty",
   "PostedDate":"2006-08-15T17:30:12-04:00",
   "Tags":["plankton", "perl", "decisions"],
   "Body":"I decided today that I don't like plankton. I like perl. Or DO I?"
 }
}
JSON
}}}

== Reading a Document ==

To read a document from database ''foo'' with the id ''document_id'':

{{{
my $db = CouchDB->new('localhost', '5984');
my $json = $db->get("foo/document_id");
}}}
