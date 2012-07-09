require 'spec_helper'

describe "subscriptions/show" do
  before(:each) do
    @subscription = assign(:subscription, stub_model(Subscription,
      :paid => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
