require 'pg'
require 'dotenv/load'

class Bookmark

  def self.all
    conn = PG::Connection.open(:dbname => ENV['DB_NAME'] )
    res  = conn.exec('SELECT url FROM bookmarks')
    res.values.flatten
  end

end
