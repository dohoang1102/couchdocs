The default location of the default.ini file is in /usr/local/etc/couchdb.  It is the local configuration file for the CouchDB server. Please note that upgrading CouchDB will overwrite default.ini, so it is a good idea to make changes to local.ini (or to use your own INI file for each CouchDB instance running).

The default configuration file is shown, with each option described in detail.

{{{
; etc/couchdb/default.ini.tpl.  Generated from default.ini.tpl.in by configure.

; Upgrading CouchDB will overwrite this file.

[couchdb]
database_dir = /usr/local/var/lib/couchdb
view_index_dir = /usr/local/var/lib/couchdb
util_driver_dir = /usr/local/lib/couchdb/erlang/lib/couch-0.10.0/priv/lib
max_document_size = 4294967296 ; 4 GB
max_attachment_chunk_size = 4294967296 ; 4GB
os_process_timeout = 5000 ; 5 seconds. for view and external servers.
max_dbs_open = 100
delayed_commits = true
batch_save_size = 1000 ; number of docs at which to save a batch
batch_save_interval = 1000 ; milliseconds after which to save batches

[httpd]
port = 5984
bind_address = 127.0.0.1
authentication_handlers = {couch_httpd_oauth, oauth_authentication_handler}, {couch_httpd_auth, default_authentication_handler}
default_handler = {couch_httpd_db, handle_request}
WWW-Authenticate = Basic realm="administrator"

[log]
file = /usr/local/var/log/couchdb/couch.log
level = info

[couch_httpd_auth]
authentication_db = users
secret = replace this with a real secret in your local.ini file
require_valid_user = false

[query_servers]
javascript = /usr/local/bin/couchjs /usr/local/share/couchdb/server/main.js

; Changing reduce_limit to false will disable reduce_limit.
; If you think you're hitting reduce_limit with a "good" reduce function,
; please let us know on the mailing list so we can fine tune the heuristic.
[query_server_config]
reduce_limit = true

; enable external as an httpd handler, then link it with commands here.
; note, this api is still under consideration.
; [external]
; mykey = /path/to/mycommand

[daemons]
view_manager={couch_view, start_link, []}
external_manager={couch_external_manager, start_link, []}
db_update_notifier={couch_db_update_notifier_sup, start_link, []}
batch_save={couch_batch_save_sup, start_link, []}
query_servers={couch_query_servers, start_link, []}
httpd={couch_httpd, start_link, []}
stats_aggregator={couch_stats_aggregator, start, []}
stats_collector={couch_stats_collector, start, []}

[httpd_global_handlers]
/ = {couch_httpd_misc_handlers, handle_welcome_req, <<"Welcome">>}
favicon.ico = {couch_httpd_misc_handlers, handle_favicon_req, "/usr/local/share/couchdb/www"}

_utils = {couch_httpd_misc_handlers, handle_utils_dir_req, "/usr/local/share/couchdb/www"}
_all_dbs = {couch_httpd_misc_handlers, handle_all_dbs_req}
_active_tasks = {couch_httpd_misc_handlers, handle_task_status_req}
_config = {couch_httpd_misc_handlers, handle_config_req}
_replicate = {couch_httpd_misc_handlers, handle_replicate_req}
_uuids = {couch_httpd_misc_handlers, handle_uuids_req}
_restart = {couch_httpd_misc_handlers, handle_restart_req}
_stats = {couch_httpd_stats_handlers, handle_stats_req}
_log = {couch_httpd_misc_handlers, handle_log_req}
_sleep = {couch_httpd_misc_handlers, handle_sleep_req}
_session = {couch_httpd_auth, handle_session_req}
_oauth = {couch_httpd_oauth, handle_oauth_req}
_user = {couch_httpd_auth, handle_user_req}

[httpd_db_handlers]
_view_cleanup = {couch_httpd_db, handle_view_cleanup_req}
_compact = {couch_httpd_db, handle_compact_req}
_design = {couch_httpd_db, handle_design_req}
_view = {couch_httpd_view, handle_db_view_req}
_temp_view = {couch_httpd_view, handle_temp_view_req}
_changes = {couch_httpd_db, handle_changes_req}

; The external module takes an optional argument allowing you to narrow it to a
; single script. Otherwise the script name is inferred from the first path section
; after _external's own path.
; _mypath = {couch_httpd_external, handle_external_req, <<"mykey">>}
; _external = {couch_httpd_external, handle_external_req}

[httpd_design_handlers]
_view = {couch_httpd_view, handle_view_req}
_show = {couch_httpd_show, handle_doc_show_req}
_list = {couch_httpd_show, handle_view_list_req}
_info = {couch_httpd_db,   handle_design_info_req}
_update = {couch_httpd_show, handle_doc_update_req}
}}}
