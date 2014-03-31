require 'spec_helper'

describe "hooks/show" do
  before(:each) do
    @hook = assign(:hook, stub_model(Hook,
      :resource_type => "Resource Type",
      :actions => "Actions"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Resource Type/)
    rendered.should match(/Actions/)
  end
end
