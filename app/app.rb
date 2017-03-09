ENV["RACK_ENV"] ||= 'development'

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

    link = Link.new(url: params[:url], title: params[:title])
    tags = Tag.first_or_create(name: params[:tags])
    link.tags << tags
    link.save
    redirect to ('/links')
end

post '/tags/filter' do
  tag = Tag.first(name: params[:name])
  @links = tag ? tag.links : []
  erb :'links/index'
end

end
