require 'pg'
require 'dotenv/load'

class Bookmark
    @@conn = PG::Connection.open(:dbname => ENV['DB_NAME'] )

  def self.all
    res  = @@conn.exec('SELECT url FROM bookmarks')
    res.values.flatten
  end

  def self.create(url)
    req  = @@conn.exec("INSERT INTO bookmarks (url) VALUES ('#{url}')")
  end

end
