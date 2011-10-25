class User
  include Mongoid::Document
  
  GENERAL = 'general'

  class << self
    def general
      User.where({:username => User::GENERAL}).first
    end
  end
  field :username, :type => String
  field :email, :type => String
  field :password, :type => String

  embeds_one :profile

  has_and_belongs_to_many :friends, :class_name => "User"
  has_and_belongs_to_many :watchers, :class_name => "User"

  has_many :walls
  
  #embedded_in :user, :inverse_of => :friends
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  after_create :initialize_relations
  
  def own_wall
    self.walls.select{|w| w.wall_type.eql?(Wall::WALL_TYPES[:user])}.first
  end
  
  def friends_wall
    self.walls.select{|w| w.wall_type.eql?(Wall::WALL_TYPES[:friends])}.first
  end

  def initialize_relations
    self.walls = [Wall.new({:wall_type => Wall::WALL_TYPES[:user]}), Wall.new({:wall_type => Wall::WALL_TYPES[:friends]})]
    #self.friends_wall = Wall.new
    self.profile = Profile.new
    self.save
  end
  
end
