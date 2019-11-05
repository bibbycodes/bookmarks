require 'pg'



class Bookmark

  def self.all
    conn = PG::Connection.open(:dbname => 'bookmark_manager')
    res  = conn.exec('SELECT url FROM bookmarks')
    res.values.flatten
  end

end