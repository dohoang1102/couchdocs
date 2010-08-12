CouchDB now natively supports SSL on trunk (this feature will be present in CouchDB 1.1)

To enable it;

1) Enable the httpsd daemon by adding the following line to your local.ini or local_dev.ini (newly generated files include this setting but commented out);

{{{
[daemons]
httpsd = {couch_httpd, start_link, [https]}
}}}

2) tell CouchDB about your SSL server keys (PEM encoded);

{{{
[ssl]
cert_file = /full/path/to/server_cert.pem
key_file = /full/path/to/server_key.pem
}}}

3) Restart CouchDB.

CouchDB should now accept SSL connections on, by default, port 6984.
