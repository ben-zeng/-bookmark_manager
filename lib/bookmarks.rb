require 'pg'
class Bookmarks

  def self.all
      bookmarks_array = []
      if ENV['ENVIRONMENT'] == 'test'
          conn = PG.connect(dbname: 'bookmark_manager_test')
      else
          conn = PG.connect(dbname: 'bookmark_manager')
      end
      conn.exec('select * from bookmarks') do |result|
          result.each {|bookmark| bookmarks_array << [bookmark['title'], bookmark['url']]}
      end
      p bookmarks_array[0][0]
      bookmarks_array
  end

  def self.create(title: , url:)
    if ENV['ENVIRONMENT'] == 'test'
        conn = PG.connect(dbname: 'bookmark_manager_test')
    else
        conn = PG.connect(dbname: 'bookmark_manager')
    end
    conn.exec("INSERT INTO bookmarks (url,title) VALUES ('#{url}','#{title}')")
  end
end
