class User
  include Mongoid::Document

  field :username, :type => String
  field :email, :type => String
  field :password, :type => String

  embeds_one :profile
  has_many :friends, :class_name => "User"
  has_one :wall
  #has_one :friends_wall
  #embedded_in :user, :inverse_of => :friends
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  before_save :initialize_wall
  before_save :initialize_profile

  def initialize_wall
    self.wall ||= Wall.new
  end

  def initialize_profile
    self.profile ||= Profile.new
  end
end
