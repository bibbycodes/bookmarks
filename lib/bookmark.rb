require 'pg'
require 'sinatra/base'
require "uri"
require 'sinatra/flash'
require_relative './setup_db'

class Bookmark

  def self.all
    res  = DatabaseConnection.query('SELECT url, title, id FROM bookmarks;')
    bookmarks = []
    res.values.each do |value| 
      bookmarks.append(Bookmark.new(value[0], value[1], value[2]))
    end
    bookmarks
  end

  def self.create(url, title)
    req  = DatabaseConnection.query(
      "INSERT INTO bookmarks (url, title) 
      VALUES ('#{url}', '#{title}');")

    res  = DatabaseConnection.query(
      "SELECT url, title, id FROM bookmarks 
      ORDER BY id DESC LIMIT 1;"
    ).values
    
    bookmark = Bookmark.new(res[0][0], res[0][1], res[0][2])
  end

  def self.remove(bookmark_id)
    req  = DatabaseConnection.query(
      "DELETE FROM bookmarks WHERE id = '#{bookmark_id}';"
    )
  end

  def self.edit(url, title, id)
    req  = DatabaseConnection.query(
      "UPDATE bookmarks
      SET url = '#{url}', title = '#{title}'
      WHERE id = #{id};
      ")
  end

  attr_reader :title, :url, :id

  def initialize(url, title, id)
    @url = url
    @title = title
    @id = id
  end

  private

  def self.check_url(url)
    url =~ URI::regexp
  end

  def self.check_title(title)
    return true unless title == ""
    return false
  end

end