require 'spec_helper'

describe "models/edit" do
  before(:each) do
    @model = assign(:model, stub_model(Model))
  end

  it "renders the edit model form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => models_path(@model), :method => "post" do
    end
  end
end
