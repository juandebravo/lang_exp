require 'net/http'

class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    params[:id].eql?(User::GENERAL) and redirect_to("/home/index", :notice => "User #{params[:id]} not found") and return
    
    u = User.where({:username => params[:id]})
    unless u.empty?
      @user = u.first
    else
      redirect_to("/home/index", :notice => "User #{params[:id]} not found") and return
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    u = User.where({:username => params[:id]})
    unless u.empty?
      @user = u.first
    else
      redirect_to("/home/index", :notice => 'User not found') and return
    end
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.where({:username => params[:id]}).first

    if @user.update_attributes(params[:user])
      LangExp::Service.update_profile current_user 
      
      redirect_to(user_path(current_user.username), :notice => 'Profile was successfully updated.')
    else
      render :action => "edit"
    end

  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
  
  def add_friend
    unless current_user.username.eql?(params[:user_id])
      redirect_to("/home/index", :notice => 'Invalid action') and return
    end
    friend = User.where({:username => params[:id]})
    friend.empty? and redirect_to("/home/index", :notice => 'Unable to add friend. User not found') and return
    friend = friend.first
    current_user.friends << friend
    friend.watchers << current_user

    LangExp::Service.add_friend(current_user, friend)

    redirect_to user_path(params[:id]), :notice => "User #{params[:id]} added as friend"
  end
  
  def delete_friend
    unless current_user.username.eql?(params[:user_id])
      redirect_to("/home/index", :notice => 'Invalid action') and return
    end
    friend = User.where({:username => params[:id]})
    friend.empty? and redirect_to("/home/index", :notice => 'Unable to add friend. User not found') and return

    friend = friend.first
    friend_id = friend._id
    logger.debug "Deleting friend #{friend_id}"
    logger.debug "Before deleting user has #{current_user.friend_ids.length}"
    current_user.friend_ids.delete_if{|f| f.eql?(friend_id)}
    current_user.save
    
    friend.watcher_ids.delete_if{|f| f.eql?(current_user._id)}
    friend.save

    logger.debug "After deleting user has #{current_user.friend_ids.length}"

    LangExp::Service.delete_friend(current_user, friend)
    
    redirect_to user_path(params[:id]), :notice => "User #{params[:id]} deleted as friend"
  end

  def snippets
    response = Net::HTTP.get_response "gist.github.com", "/api/v1/json/gists/#{params[:user_id]}"
    decoded = ActiveSupport::JSON.decode response.body
    @snippets = decoded["gists"] 
    logger.error @snippets
  end
end
