require 'pg'

class Bookmark

  def self.all
    conn = check_env
    res = conn.exec('SELECT url, title FROM bookmarks;')
    res.values
  end

  def self.create(url, title)
    conn = check_env
    req  = conn.exec("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}');")
    last_bookmark = conn.exec('SELECT url, id, title FROM bookmarks ORDER BY id DESC LIMIT 1;').values
    Bookmark.new(
      last_bookmark[0][1], last_bookmark[0][2], last_bookmark[0][0]
    )
  end

  def self.remove(bookmark_url)
    conn = check_env
    req  = conn.exec("DELETE FROM bookmarks WHERE url = '#{bookmark_url}';")
  end

  private

  def self.check_env
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG::Connection.open(:dbname => "bookmark_manager_test" )
    else
      conn = PG::Connection.open(:dbname => "bookmark_manager" )
    end
  end

  public

  # instance methods
  attr_reader :id, :title, :url
  
  def initialize(id, title, url)
    @id = id
    @title = title
    @url = url
  end


end