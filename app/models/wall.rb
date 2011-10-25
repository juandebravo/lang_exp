class Wall
  include Mongoid::Document
  WALL_TYPES = {:user => "user", :friends => "friends"}

  field :wall_type, :type => String, :default => WALL_TYPES[:user]
  
  has_and_belongs_to_many :feeds
  belongs_to :user

end
