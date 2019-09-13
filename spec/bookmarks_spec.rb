require './lib/bookmarks.rb'
require 'pg'

describe Bookmarks do
  it 'all' do
    #conn = PG.connect(dbname: 'bookmark_manager_test')
    bookmark = Bookmarks.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
    p bookmark
    Bookmarks.create(title: 'Destroy All Software', url: 'http://www.destroyallsoftware.com')
    Bookmarks.create(title: 'Google', url: 'http://www.google.com')
    bookmarks = Bookmarks.all
    expect(bookmarks.length).to eq 3
    expect(bookmarks.first).to be_a Bookmarks
    expect(bookmarks.first.title).to eq 'Makers Academy'
    expect(bookmarks.first.id).to eq bookmark.id
    expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
  end

  it 'create' do
    bookmark = Bookmarks.create(title: 'Test Page', url: 'www.testpage.com')
    expect(bookmark.title).to include('Test Page')
    expect(bookmark.url).to include("www.testpage.com")
  end

  it 'delete' do
    #result = conn.exec("INSERT INTO bookmarks (url,title) VALUES ('http://www.makersacademy.com','Makers Academy') RETURNING id, url, title;")
    #bookmark = Bookmarks.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
    bookmark = Bookmarks.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
    Bookmarks.create(title: 'Makers 2', url: 'http://www.2.com')
    Bookmarks.delete(id: bookmark.id)
    bookmarks = Bookmarks.all
    expect(bookmarks.last.title).to_not include('Makers Academy')
  end

end
