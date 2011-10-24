require 'spec_helper'

describe "walls/show.html.erb" do
  before(:each) do
    @wall = assign(:wall, stub_model(Wall))
  end

  it "renders attributes in <p>" do
    render
  end
end
