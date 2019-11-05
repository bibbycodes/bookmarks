require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all

    erb(:'bookmarks/index')
  end

  post '/bookmarks/add' do
    @new_bookmark =  params[:new_url]
    Bookmark.create(@new_bookmark)
    redirect '/bookmarks'
  end
  
  run! if app_file == $0
end