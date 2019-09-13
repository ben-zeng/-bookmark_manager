require 'sinatra/base'
require './lib/bookmarks.rb'
require './database_connection_setup.rb'
# require 'uri'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base
  enable :method_override, :sessions
  register Sinatra::Flash

  get '/' do
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb(:bookmarks)
  end

  post '/bookmarks' do
    if Bookmarks.create(title: params[:title],url: params[:url]) == false
      flash[:notice] = 'Invalid url!!!!'
    end

    redirect '/bookmarks'


  end

  delete '/bookmarks/:id' do
    Bookmarks.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    erb(:'bookmarks/edit')
  end

  patch '/bookmarks/:id' do
    Bookmarks.edit(id: params[:id], title: params[:title])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/comments' do
    erb(:'bookmarks/comments')
  end


  run! if app_file == $0
end
