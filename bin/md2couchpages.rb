#!/usr/bin/env ruby
require "couchrest"
require "enc/trans/transdb"

target_dir = File.join(File.dirname(__FILE__), '../site/translated/')

db_url = "http://jchris:jchris@localhost:5984/couchdb-wiki"
db = CouchRest.database(db_url)

Dir[File.join(target_dir, "**")].each do |name|

  article = open(name).read
  next if article.match("system and help pages")
  title = File.basename(name, ".md")
  puts "saving #{title}"
  doc = {
    "jquery.couch.attachPrevRev" => true,
    "title" => title,
    "_id" => title,
    "markdown" => article,
    "edit_at" => Time.now,
    "edit_by" => {
      "name" => "moinmoin import"
    },
    "log" => [{
      "note" => "import from http://wiki.apache.org/couchdb/"+title
    }]
  }
  olddoc = db.get(title) rescue nil
  doc["_rev"]  = olddoc["_rev"] if olddoc
  db.save_doc(doc)
end