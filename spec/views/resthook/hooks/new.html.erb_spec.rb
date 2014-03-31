require 'spec_helper'

describe "hooks/new" do
  before(:each) do
    assign(:hook, stub_model(Hook,
      :resource_type => "MyString",
      :actions => "MyString"
    ).as_new_record)
  end

  it "renders new hook form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", hooks_path, "post" do
      assert_select "input#hook_resource_type[name=?]", "hook[resource_type]"
      assert_select "input#hook_actions[name=?]", "hook[actions]"
    end
  end
end
