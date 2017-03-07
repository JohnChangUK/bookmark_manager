require 'sinatra/base'
require './app/models/link.rb'
require 'database_cleaner'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    Link.create(url: params[:url], title: params[:title])
    redirect '/links'
  end

end
