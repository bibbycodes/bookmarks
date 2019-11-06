require 'pg'

def truncate_and_load_bookmarks
  conn = PG::Connection.open(:dbname => 'bookmark_manager_test')
  res  = conn.exec(
    "TRUNCATE bookmarks;
    INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'Makers Academy');
    INSERT INTO bookmarks (url, title) VALUES ('http://www.google.com', 'Google');
    INSERT INTO bookmarks (url, title) VALUES ('http://www.askjeeves.com', 'Ask Jeeves');
    ")
end
