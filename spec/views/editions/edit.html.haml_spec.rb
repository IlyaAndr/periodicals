require 'spec_helper'

describe "editions/edit" do
  before(:each) do
    @edition = assign(:edition, stub_model(Edition,
      :title => "MyString",
      :description => "MyText",
      :price => "9.99"
    ))
  end

  it "renders the edit edition form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => editions_path(@edition), :method => "post" do
      assert_select "input#edition_title", :name => "edition[title]"
      assert_select "textarea#edition_description", :name => "edition[description]"
      assert_select "input#edition_price", :name => "edition[price]"
    end
  end
end
