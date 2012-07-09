require 'spec_helper'

describe "editions/index" do
  before(:each) do
    assign(:editions, [
      stub_model(Edition,
        :title => "Title",
        :description => "MyText",
        :price => "9.99"
      ),
      stub_model(Edition,
        :title => "Title",
        :description => "MyText",
        :price => "9.99"
      )
    ])
  end

  it "renders a list of editions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
