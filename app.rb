require 'sinatra/base'
require './lib/bookmarks.rb'

class BookmarkManager < Sinatra::Base
  enable :method_override
  get '/' do
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb(:bookmarks)
  end

  post '/bookmarks' do
    Bookmarks.create(title: params[:title],url: params[:url])
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

  run! if app_file == $0
end
