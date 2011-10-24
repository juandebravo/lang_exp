class User
  include Mongoid::Document

  field :username, :type => String
  field :email, :type => String
  field :password, :type => String

  embeds_one :profile
  has_many :friends, :class_name => "User"

  #embedded_in :user, :inverse_of => :friends
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

end
