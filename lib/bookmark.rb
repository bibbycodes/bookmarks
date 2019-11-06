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

end
