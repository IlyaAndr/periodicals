require 'spec_helper'

describe "models/index" do
  before(:each) do
    assign(:models, [
      stub_model(Model),
      stub_model(Model)
    ])
  end

  it "renders a list of models" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
