#redirect API_Cheatsheet
= CouchDB Server Level Requests =

== info ==

GET /

== all_dbs ==

GET /_all_dbs

== replicate ==

POST /_replicate

= CouchDB Database Level Requests =

== compact ==

POST /'''db'''/_compact

== create ==

PUT /'''db'''

== drop ==

DELETE /'''db'''

== info ==

GET /'''db'''

== all_docs ==

GET /'''db'''/_all_docs

== open_doc ==

GET /'''db'''/'''doc_id'''

== save_doc (CREATE) ==

POST /'''db'''

== save_doc (UPDATE) ==

PUT /'''db'''/'''doc_id'''

== remove_doc ==

DELETE /'''db'''/'''doc_id'''

== bulk_docs ==

POST /'''db'''/_bulk_docs

== query (aka temporary view) ==

POST /'''db'''/_temp_view

== view ==

GET /'''db'''/_view/'''name'''
