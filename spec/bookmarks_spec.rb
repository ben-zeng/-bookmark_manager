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

end
