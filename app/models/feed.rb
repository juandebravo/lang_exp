class Feed
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Commentable

  field :title, :type => String
  field :description, :type => String

#has_and_belongs_to_many :walls
end
