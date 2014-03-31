require 'spec_helper'

describe "hooks/index" do
  before(:each) do
    assign(:hooks, [
      stub_model(Hook,
        :resource_type => "Resource Type",
        :actions => "Actions"
      ),
      stub_model(Hook,
        :resource_type => "Resource Type",
        :actions => "Actions"
      )
    ])
  end

  it "renders a list of hooks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Resource Type".to_s, :count => 2
    assert_select "tr>td", :text => "Actions".to_s, :count => 2
  end
end
