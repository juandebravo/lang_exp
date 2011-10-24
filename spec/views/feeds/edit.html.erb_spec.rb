require 'spec_helper'

describe "feeds/edit.html.erb" do
  before(:each) do
    @feed = assign(:feed, stub_model(Feed,
      :title => "",
      :description => ""
    ))
  end

  it "renders the edit feed form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => feeds_path(@feed), :method => "post" do
      assert_select "input#feed_title", :name => "feed[title]"
      assert_select "input#feed_description", :name => "feed[description]"
    end
  end
end
