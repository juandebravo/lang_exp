require 'spec_helper'

describe "feeds/new.html.erb" do
  before(:each) do
    assign(:feed, stub_model(Feed,
      :title => "",
      :description => ""
    ).as_new_record)
  end

  it "renders new feed form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => feeds_path, :method => "post" do
      assert_select "input#feed_title", :name => "feed[title]"
      assert_select "input#feed_description", :name => "feed[description]"
    end
  end
end
