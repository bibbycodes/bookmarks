require 'sinatra/base'
require 'sinatra/flash'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  
  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    #flash[:keys] = "Helloo"
    erb(:'bookmarks/index')
  end

  post '/bookmarks/add' do
    @new_url =  params[:new_url]
    @new_title = params[:new_title]

    if !Bookmark.check_url(@new_url)
      flash[:notice] = "Please enter a valid url"
      flash[:alert] = "danger"
    elsif !Bookmark.check_title(@new_title)
      flash[:notice] = "Please enter a title"
      flash[:alert] = "danger"
    else
      Bookmark.create(@new_url, @new_title)
    end

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
  
    if !Bookmark.check_url(@url)
      flash[:notice] = "Please enter a valid url"
      flash[:alert] = "danger"
    elsif !Bookmark.check_title(@title)
      flash[:notice] = "Please enter a title"
      flash[:alert] = "danger"
    else
      Bookmark.edit(@url, @title, @id)
      redirect '/bookmarks'
    end

    redirect "/bookmarks/edit/#{@id}"
  end

  post '/bookmarks/delete/:id' do
    Bookmark.remove(params[:id])
    redirect '/bookmarks'
  end
  
  run! if app_file == $0
end