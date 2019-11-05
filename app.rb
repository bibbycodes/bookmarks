require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = [
      "http://www.makersacademy.com",
      "http://www.google.com",
      "http://www.github.com"
    ]

    erb(:'bookmarks/index')

    @bookmarks.join
  end
  
  run! if app_file == $0
end