class HomeController < ApplicationController
  def index
    @wall = User.general.own_wall
  end

  def about
  end

end
