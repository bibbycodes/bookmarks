require 'pg'

def truncate_and_load_bookmarks
  conn = PG::Connection.open(:dbname => ENV['DB_NAME'])
  res  = conn.exec(
    "TRUNCATE bookmarks;
    INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');
    INSERT INTO bookmarks (url) VALUES ('http://www.google.com');
    INSERT INTO bookmarks (url) VALUES ('http://www.askjeeves.com');")
end
