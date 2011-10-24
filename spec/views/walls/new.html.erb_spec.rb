require 'spec_helper'

describe "walls/new.html.erb" do
  before(:each) do
    assign(:wall, stub_model(Wall).as_new_record)
  end

  it "renders new wall form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => walls_path, :method => "post" do
    end
  end
end
