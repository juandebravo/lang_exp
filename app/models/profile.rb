class Profile
  include Mongoid::Document
  field :name, :type => String
  field :surname, :type => String
  
  embedded_in :user
end
