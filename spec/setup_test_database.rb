

def setup_test_database
  p "Exterminating content in all databases... / wiping hard drive..."
  conn = PG.connect(dbname: 'bookmark_manager_test')
  conn.exec("TRUNCATE bookmarks;")
end

def create_test_rows
  Bookmarks.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
  Bookmarks.create(url: 'http://www.destroyallsoftware.com', title: 'Destroy All Software')
  Bookmarks.create(url: 'http://www.google.com', title: 'Google')
end
