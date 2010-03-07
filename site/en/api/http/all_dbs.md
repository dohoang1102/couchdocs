template: page.html
title: _all_dbs

Listing Databases
=================

To get the list of databases in CouchDB you can use the `_all_dbs` resource.

    $ curl -vs http://127.0.0.1:5984/_all_dbs
    > GET /_all_dbs HTTP/1.1
    > User-Agent: curl/7.19.4
    > Host: 127.0.0.1:5984
    > Accept: */*
    > 
    < HTTP/1.1 200 OK
    < Server: CouchDB/0.11.0b209ad163-git (Erlang OTP/R13B)
    < Date: Sun, 07 Mar 2010 22:22:26 GMT
    < Content-Type: text/plain;charset=utf-8
    < Content-Length: 24
    < Cache-Control: must-revalidate
    < 
    [
      "my_db", 
      "my_other_db"
    ]
