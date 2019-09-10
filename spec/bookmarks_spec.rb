require './lib/bookmarks.rb'
require 'pg'

describe Bookmarks do
  it 'all' do
    conn = PG.connect(dbname: 'bookmark_manager_test')
    conn.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
    conn.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
    conn.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
    bookmarks = Bookmarks.all
    expect(bookmarks).to include('http://www.makersacademy.com')
    expect(bookmarks).to include('http://www.destroyallsoftware.com')
    expect(bookmarks).to include('http://www.google.com')
  end
end