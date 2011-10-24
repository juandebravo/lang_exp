class User
  include Mongoid::Document

  field :username, :type => String
  field :email, :type => String
  field :password, :type => String

  embeds_one :profile

  has_and_belongs_to_many :friends, :class_name => "User"
  has_and_belongs_to_many :watchers, :class_name => "User"

  has_one :wall
  
  #has_one :friends_wall
  #embedded_in :user, :inverse_of => :friends
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  after_create :initialize_relations

  def initialize_relations
    self.wall = Wall.new
    self.profile = Profile.new
    self.save
  end
  
end
