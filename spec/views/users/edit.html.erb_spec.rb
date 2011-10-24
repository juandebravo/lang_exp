require 'spec_helper'

describe "users/edit.html.erb" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :username => "",
      :password => "",
      :profile => "",
      :friends => ""
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path(@user), :method => "post" do
      assert_select "input#user_username", :name => "user[username]"
      assert_select "input#user_password", :name => "user[password]"
      assert_select "input#user_profile", :name => "user[profile]"
      assert_select "input#user_friends", :name => "user[friends]"
    end
  end
end
