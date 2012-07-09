require 'spec_helper'

describe "editions/show" do
  before(:each) do
    @edition = assign(:edition, stub_model(Edition,
      :title => "Title",
      :description => "MyText",
      :price => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/9.99/)
  end
end
