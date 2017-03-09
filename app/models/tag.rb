require 'data_mapper'
require 'dm-postgres-adapter'

class Tag

  attr_reader :name

  include DataMapper::Resource

  has n, :links, through: Resource

  property :id, Serial
  property :name, String
end
