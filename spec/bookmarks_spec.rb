require './lib/bookmarks.rb'
require 'pg'

describe Bookmarks do
  it 'all' do
    conn = PG.connect(dbname: 'bookmark_manager_test')
    conn.exec("INSERT INTO bookmarks (url,title) VALUES ('http://www.makersacademy.com','Makers Academy');")
    conn.exec("INSERT INTO bookmarks (url,title) VALUES('http://www.destroyallsoftware.com','Destroy All Software');")
    conn.exec("INSERT INTO bookmarks (url,title) VALUES('http://www.google.com','Google');")
    bookmarks = Bookmarks.all
    expect(bookmarks).to include(["Makers Academy", "http://www.makersacademy.com"])
    expect(bookmarks).to include(["Destroy All Software", "http://www.destroyallsoftware.com"])
    expect(bookmarks).to include(["Google", "http://www.google.com"])
  end

  it 'create' do
    Bookmarks.create(title: 'Test Page', url: 'www.testpage.com')
    expect(Bookmarks.all).to include(['Test Page', "www.testpage.com"])
  end
end
