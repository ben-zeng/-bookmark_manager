
class Bookmarks
  attr_reader :id, :title, :url

  def self.all
      result = DatabaseConnection.query('select * from bookmarks')
      result.map do |bookmark|
        Bookmarks.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
      end
  end

  def self.create(title: , url:)
    result = DatabaseConnection.query("INSERT INTO bookmarks (url,title) VALUES ('#{url}','#{title}') RETURNING id, url, title;")
    Bookmarks.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE from bookmarks where id = #{id}")
  end

  def self.edit(id:, title:)
    result = DatabaseConnection.query("UPDATE bookmarks SET title = '#{title}' where id = '#{id}' RETURNING id, url, title;")
    Bookmarks.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end


end

