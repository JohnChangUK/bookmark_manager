require 'data_mapper'
require 'dm-postgres-adapter'

class Link

  include DataMapper::Resource

  has n, :tags, through: Resource

  property :id, Serial
  property :title, String
  property :url, String

  # def check_tag(tag)
  #   true if self.tag == tag
  #
  # end

end
