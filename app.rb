require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable :sessions
  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:'bookmarks/index')
  end

  post '/bookmarks/add' do
    @new_url =  params[:new_url]
    @new_title = params[:new_title]

    Bookmark.create(@new_url, @new_title)
    redirect '/bookmarks'
  end

  get '/bookmarks/edit/:id' do
    @id = params[:id]
    erb(:'bookmarks/edit')
  end

  post '/bookmarks/edit/:id' do
    @id = params[:id]
    @title = params[:edit_title]
    @url = params[:edit_url]
    Bookmark.edit(@url, @title, @id)
    redirect '/bookmarks'
  end

  post '/bookmarks/delete/:id' do
    Bookmark.remove(params[:id])
    redirect '/bookmarks'
  end
  
  run! if app_file == $0
end