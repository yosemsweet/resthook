require 'spec_helper'

describe 'hooks/edit' do
  let(:hook) do
    stub_model(Hook,
               subscribed_resource: 'Subscribed Resource Test Type',
               event: 'Tested')
  end
  before(:each) do
    assign(:hook, hook).as_new_record
  end

  it 'renders the edit hook form' do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select 'form[action=?][method=?]', hook_path(@hook), 'post' do
      assert_select 'input#hook_subscribed_resource[name=?]', 'hook[subscribed_resource]'
      assert_select 'input#hook_event[name=?]', 'hook[event]'
    end
  end
end
