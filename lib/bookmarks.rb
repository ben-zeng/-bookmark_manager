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
          result.each {|bookmark| bookmarks_array << bookmark['url']}
      end
      bookmarks_array
      end

end
