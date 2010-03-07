template: page.html
title: _config

The _config resource
====================

    $ curl -vs http://127.0.0.1:5984/_config
    > GET /_config HTTP/1.1
    > User-Agent: curl/7.19.4
    > Host: 127.0.0.1:5984
    > Accept: */*
    > 
    < HTTP/1.1 200 OK
    < Server: CouchDB/0.11.0b209ad163-git (Erlang OTP/R13B)
    < Date: Sun, 07 Mar 2010 23:00:50 GMT
    < Content-Type: text/plain;charset=utf-8
    < Content-Length: 3243
    < Cache-Control: must-revalidate
    < 
    {
      "attachments": {
        "compressible_types": "text/* application/javascript application/json application/xml", 
        "compression_level": "8"
      }, 
      "couch_httpd_auth": {
        "authentication_db": "_users", 
        "require_valid_user": "false"
      }, 
      "couchdb": {
        "batch_save_interval": "1000", 
        "batch_save_size": "1000", 
        "database_dir": "/path/to/couchdb/lib", 
        "delayed_commits": "true", 
        "max_attachment_chunk_size": "4294967296", 
        "max_dbs_open": "100", 
        "max_document_size": "4294967296", 
        "os_process_timeout": "5000", 
        "util_driver_dir": "/path/to/couchdb/priv/", 
        "view_index_dir": "/path/to/couchdb/lib"
      }, 
      "daemons": {
        "db_update_notifier": "{couch_db_update_notifier_sup, start_link, []}", 
        "external_manager": "{couch_external_manager, start_link, []}", 
        "httpd": "{couch_httpd, start_link, []}", 
        "query_servers": "{couch_query_servers, start_link, []}", 
        "stats_aggregator": "{couch_stats_aggregator, start, []}", 
        "stats_collector": "{couch_stats_collector, start, []}", 
        "uuids": "{couch_uuids, start, []}", 
        "view_manager": "{couch_view_server, start_link, []}"
      }, 
      "httpd": {
        "authentication_handlers": "{couch_httpd_oauth, oauth_authentication_handler}, {couch_httpd_auth, cookie_authentication_handler}, {couch_httpd_auth, default_authentication_handler}", 
        "bind_address": "127.0.0.1", 
        "default_handler": "{couch_httpd_db, handle_request}", 
        "port": "5984"
      }, 
      "httpd_db_handlers": {
        "_changes": "{couch_httpd_db, handle_changes_req}", 
        "_compact": "{couch_httpd_db, handle_compact_req}", 
        "_design": "{couch_httpd_db, handle_design_req}", 
        "_view_cleanup": "{couch_httpd_db, handle_view_cleanup_req}"
      }, 
      "httpd_design_handlers": {
        "_info": "{couch_httpd_db,   handle_design_info_req}", 
        "_list": "{couch_httpd_show, handle_view_list_req}", 
        "_rewrite": "{couch_httpd_rewrite, handle_rewrite_req}", 
        "_show": "{couch_httpd_show, handle_doc_show_req}", 
        "_update": "{couch_httpd_show, handle_doc_update_req}", 
        "_view": "{couch_httpd_view, handle_view_req}"
      }, 
      "httpd_global_handlers": {
        "/": "{couch_httpd_misc_handlers, handle_welcome_req, <<\"Welcome\">>}", 
        "_active_tasks": "{couch_httpd_misc_handlers, handle_task_status_req}", 
        "_all_dbs": "{couch_httpd_misc_handlers, handle_all_dbs_req}", 
        "_config": "{couch_httpd_misc_handlers, handle_config_req}", 
        "_log": "{couch_httpd_misc_handlers, handle_log_req}", 
        "_oauth": "{couch_httpd_oauth, handle_oauth_req}", 
        "_replicate": "{couch_httpd_misc_handlers, handle_replicate_req}", 
        "_restart": "{couch_httpd_misc_handlers, handle_restart_req}", 
        "_session": "{couch_httpd_auth, handle_session_req}", 
        "_sleep": "{couch_httpd_misc_handlers, handle_sleep_req}", 
        "_stats": "{couch_httpd_stats_handlers, handle_stats_req}", 
        "_utils": "{couch_httpd_misc_handlers, handle_utils_dir_req, \"/path/to/couchdb/share/www\"}", 
        "_uuids": "{couch_httpd_misc_handlers, handle_uuids_req}", 
        "favicon.ico": "{couch_httpd_misc_handlers, handle_favicon_req, \"/path/to/couchdb/share/www\"}"
      }, 
      "log": {
        "file": "/path/to/couchdb/log/couch.log", 
        "level": "info"
      }, 
      "query_server_config": {
        "reduce_limit": "true"
      }, 
      "query_servers": {
        "javascript": "/path/to/couchdb/bin/couchjs_dev /path/to/couchdb/share/server/main.js"
      }, 
      "stats": {
        "rate": "1000", 
        "samples": "[0, 60, 300, 900]"
      }, 
      "uuids": {
        "algorithm": "sequential"
      }
    }
