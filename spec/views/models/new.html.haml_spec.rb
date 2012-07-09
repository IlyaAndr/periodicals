require 'spec_helper'

describe "models/new" do
  before(:each) do
    assign(:model, stub_model(Model).as_new_record)
  end

  it "renders new model form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => models_path, :method => "post" do
    end
  end
end
