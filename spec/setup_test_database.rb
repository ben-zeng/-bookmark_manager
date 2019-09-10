require 'pg'

def setup_test_database
  p "Exterminating content in all databases... / wiping hard drive..."
  conn = PG.connect(dbname: 'bookmark_manager_test')
  conn.exec("TRUNCATE bookmarks;")
end

