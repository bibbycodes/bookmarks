require 'pg'

class Bookmark

  def self.all
    conn = connect_to_db
    res  = conn.exec('SELECT url, title, id FROM bookmarks;')
    res.values
  end

  def self.create(url, title)
    conn = connect_to_db
    req  = conn.exec("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}');")
    res  = conn.exec('SELECT url, title, id FROM bookmarks ORDER BY id DESC LIMIT 1;').values
    bookmark = Bookmark.new(res[0][0], res[0][1], res[0][2])
  end

  def self.remove(bookmark_id)
    conn = connect_to_db
    req  = conn.exec("DELETE FROM bookmarks WHERE id = '#{bookmark_id}';")
  end

  private

  def self.connect_to_db
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG::Connection.open(:dbname => "bookmark_manager_test" )
    else
      conn = PG::Connection.open(:dbname => "bookmark_manager" )
    end
  end

  public

  attr_reader :title, :url, :id

  def initialize(url, title, id)
    @url = url
    @title = title
    @id = id
  end

end