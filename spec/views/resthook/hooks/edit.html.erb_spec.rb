require 'spec_helper'

describe "hooks/edit" do
  before(:each) do
    @hook = assign(:hook, stub_model(Hook,
      :resource_type => "MyString",
      :actions => "MyString"
    ))
  end

  it "renders the edit hook form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", hook_path(@hook), "post" do
      assert_select "input#hook_resource_type[name=?]", "hook[resource_type]"
      assert_select "input#hook_actions[name=?]", "hook[actions]"
    end
  end
end
