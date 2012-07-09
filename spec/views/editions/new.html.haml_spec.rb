require 'spec_helper'

describe "editions/new" do
  before(:each) do
    assign(:edition, stub_model(Edition,
      :title => "MyString",
      :description => "MyText",
      :price => "9.99"
    ).as_new_record)
  end

  it "renders new edition form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => editions_path, :method => "post" do
      assert_select "input#edition_title", :name => "edition[title]"
      assert_select "textarea#edition_description", :name => "edition[description]"
      assert_select "input#edition_price", :name => "edition[price]"
    end
  end
end
