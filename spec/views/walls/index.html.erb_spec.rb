require 'spec_helper'

describe "walls/index.html.erb" do
  before(:each) do
    assign(:walls, [
      stub_model(Wall),
      stub_model(Wall)
    ])
  end

  it "renders a list of walls" do
    render
  end
end
