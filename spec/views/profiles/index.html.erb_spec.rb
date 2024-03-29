require 'spec_helper'

describe "profiles/index.html.erb" do
  before(:each) do
    assign(:profiles, [
      stub_model(Profile,
        :name => "",
        :surname => "",
        :email => ""
      ),
      stub_model(Profile,
        :name => "",
        :surname => "",
        :email => ""
      )
    ])
  end

  it "renders a list of profiles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
