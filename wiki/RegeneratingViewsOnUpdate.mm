#redirect Regenerating_views_on_update
= Update views on document save =

CouchDB defaults to regenerating views the first time they are accessed. This behavior is preferable in most cases as it optimizes the resource utilization on the database server. 
On the other hand, in some situations the benefit of always having fast and updated views far outweigh the cost of regenerating them every time the database server receives updates. This can be achieved by supplying an updater script that calls the views when needed.

== Example using ruby ==

=== couch.ini ===
Add the following line to the couch.ini file {{{
	DbUpdateNotificationProcess=/PATH/TO/view_updater.rb
}}}

=== view_updater.rb ===
The following script updates the views for each tenth update made to the database or at most once every second when a lot of saves are performed {{{
#!/usr/bin/ruby

###################
# CONF            #
###################

# The smallest amount of changed documents before the views are updated
MIN_NUM_OF_CHANGED_DOCS = 10

# URL to the DB on the CouchDB server
URL = "http://localhost:5984"

# Set the minimum pause between calls to the database
PAUSE = 1 # seconds

# One entry for each design document 
# in each database
VIEWS = {"DATABASE_NAME"  => ["list_of/design_documents",
                              "another/design_document"],
         "recipes"        => ["category/most_popular"],
         "ingredients"    => ["by/price"]}        
        

###################
# RUNTIME         #
###################

run = true
number_of_changed_docs = {}

threads = []

# Updates the views
threads << Thread.new do

  while run do

    number_of_changed_docs.each_pair do |db_name, number_of_docs|
      if number_of_docs >= MIN_NUM_OF_CHANGED_DOCS
        
        # Reset the value
        number_of_changed_docs[db_name] = 0
        
        # If there are views in the database, get them
        if VIEWS[db_name]
          VIEWS[db_name].each do |view|
            `curl #{URL}/#{db_name}/_view/#{view}?count=0`
          end  
        end
                
      end
    end

    # Pause before starting over again
    sleep PAUSE
    
  end
  
end

# Receives the update notification from CouchDB
threads << Thread.new do

  while run do

    puts "Waiting for input:"
    update_call = gets
    
    # When CouchDB exits the script gets called with
    # a never ending series of nil
    if update_call == nil
      run = false
    else
      
      # Get the database name out of the call data
      # The data looks somethind like this:
      # {"type":"updated","db":"DB_NAME"}\n
      update_call =~ /\"db\":\"(\w+)\"/
      database_name = $1
      
      # Set to 0 if it hasn't been initialized before
      number_of_changed_docs[$1] ||= 0
      
      # Add one pending changed document to the list of documents
      # in the DB
      number_of_changed_docs[$1] += 1
      
    end
    
  end

end

# Good bye
threads.each {|thr| thr.join}

}}}

The view_updater.rb itself has to be made executable by CouchDB (chmod 0700?).
