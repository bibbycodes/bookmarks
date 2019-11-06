require 'pg'

class Bookmark

  def self.all
    conn = check_env
    res = conn.exec('SELECT url, title FROM bookmarks')
    for val in res.values
      title = val[1]
      url = val[0]
    end
  end

  def self.create(url, title)
    conn = check_env
    req  = conn.exec("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}')")
  end

  def self.check_env
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG::Connection.open(:dbname => "bookmark_manager_test" )
    else
      conn = PG::Connection.open(:dbname => "bookmark_manager" )
    end
  end
end
