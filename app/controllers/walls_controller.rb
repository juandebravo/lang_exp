class WallsController < ApplicationController

  def index
    logger.error user_signed_in?
    get_wall(params[:user_id], :own_wall)
  end

  def show
    get_wall(params[:user_id], :friends_wall)
  end
  
  private
  
  def get_wall(username = nil, type)
    if username.nil?
      if user_signed_in?
        @wall = current_user.send(type)
      else
        redirect_to("/home/index", :notice => 'User not found') and return
      end
    else
      u = User.where({:username => username})
      unless u.empty?
        @wall = u.first.send(type)
      else
        redirect_to("/home/index", :notice => 'User not found') and return
      end
    end
    render :show
  end

end
