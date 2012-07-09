require 'spec_helper'

describe "subscriptions/new" do
  before(:each) do
    assign(:subscription, stub_model(Subscription,
      :paid => false
    ).as_new_record)
  end

  it "renders new subscription form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => subscriptions_path, :method => "post" do
      assert_select "input#subscription_paid", :name => "subscription[paid]"
    end
  end
end
