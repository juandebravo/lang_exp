class Snippet
  include Mongoid::Document
  include Mongoid::Commentable
  
  field :github_id, :type => String
  
  validates_uniqueness_of :github_id  
  
  belongs_to :user
end
