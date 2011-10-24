require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ProfilesController do

  # This should return the minimal set of attributes required to create a valid
  # Profile. As you add validations to Profile, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all profiles as @profiles" do
      profile = Profile.create! valid_attributes
      get :index
      assigns(:profiles).should eq([profile])
    end
  end

  describe "GET show" do
    it "assigns the requested profile as @profile" do
      profile = Profile.create! valid_attributes
      get :show, :id => profile.id
      assigns(:profile).should eq(profile)
    end
  end

  describe "GET new" do
    it "assigns a new profile as @profile" do
      get :new
      assigns(:profile).should be_a_new(Profile)
    end
  end

  describe "GET edit" do
    it "assigns the requested profile as @profile" do
      profile = Profile.create! valid_attributes
      get :edit, :id => profile.id
      assigns(:profile).should eq(profile)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Profile" do
        expect {
          post :create, :profile => valid_attributes
        }.to change(Profile, :count).by(1)
      end

      it "assigns a newly created profile as @profile" do
        post :create, :profile => valid_attributes
        assigns(:profile).should be_a(Profile)
        assigns(:profile).should be_persisted
      end

      it "redirects to the created profile" do
        post :create, :profile => valid_attributes
        response.should redirect_to(Profile.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved profile as @profile" do
        # Trigger the behavior that occurs when invalid params are submitted
        Profile.any_instance.stub(:save).and_return(false)
        post :create, :profile => {}
        assigns(:profile).should be_a_new(Profile)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Profile.any_instance.stub(:save).and_return(false)
        post :create, :profile => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested profile" do
        profile = Profile.create! valid_attributes
        # Assuming there are no other profiles in the database, this
        # specifies that the Profile created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Profile.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => profile.id, :profile => {'these' => 'params'}
      end

      it "assigns the requested profile as @profile" do
        profile = Profile.create! valid_attributes
        put :update, :id => profile.id, :profile => valid_attributes
        assigns(:profile).should eq(profile)
      end

      it "redirects to the profile" do
        profile = Profile.create! valid_attributes
        put :update, :id => profile.id, :profile => valid_attributes
        response.should redirect_to(profile)
      end
    end

    describe "with invalid params" do
      it "assigns the profile as @profile" do
        profile = Profile.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Profile.any_instance.stub(:save).and_return(false)
        put :update, :id => profile.id, :profile => {}
        assigns(:profile).should eq(profile)
      end

      it "re-renders the 'edit' template" do
        profile = Profile.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Profile.any_instance.stub(:save).and_return(false)
        put :update, :id => profile.id, :profile => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested profile" do
      profile = Profile.create! valid_attributes
      expect {
        delete :destroy, :id => profile.id
      }.to change(Profile, :count).by(-1)
    end

    it "redirects to the profiles list" do
      profile = Profile.create! valid_attributes
      delete :destroy, :id => profile.id
      response.should redirect_to(profiles_url)
    end
  end

end
