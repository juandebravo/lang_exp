class ProfilesController < ApplicationController
  # GET /profiles
  # GET /profiles.xml
  def index
    if params.has_key?(:user_id)
      u = User.where({:username => params[:user_id]})
      unless u.empty?
        @profile = u.first.profile
      else
        redirect_to("/home/index", :notice => 'User not found') and return
      end
    else
      if user_sign_in?
        @profile = current_user.profile
      else
        redirect_to("/home/index", :notice => 'User not found') and return
      end
    end
    render :show
  end

  # GET /profiles/1
  # GET /profiles/1.xml
  def show
    if params.has_key?(:user_id)
      @profile = current_user.profile
    else
      @profile = Profile.new
    end
  end

  # GET /profiles/new
  # GET /profiles/new.xml
  def new
    @profile = Profile.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @profile }
    end
  end

  # GET /profiles/1/edit
  def edit
    @profile = current_user.profile
  end

  # POST /profiles
  # POST /profiles.xml
  def create
    @profile = Profile.new(params[:profile])

    respond_to do |format|
      if @profile.save
        format.html { redirect_to(@profile, :notice => 'Profile was successfully created.') }
        format.xml  { render :xml => @profile, :status => :created, :location => @profile }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @profile = current_user.profile

    if @profile.update_attributes(params[:profile])
      
      LangExp::Service.create_feed(current_user, {:title => 'Profile changed', :description => 'You changed your profile'})
      
      redirect_to(user_profile_index_path(current_user.username), :notice => 'Profile was successfully updated.')
    else
      render :action => "edit"
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.xml
  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to(profiles_url) }
      format.xml  { head :ok }
    end
  end
end
