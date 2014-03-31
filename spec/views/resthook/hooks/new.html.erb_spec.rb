require 'spec_helper'

describe 'hooks/new' do
  let(:hook) do
    stub_model(Hook,
               subscribed_resource: 'Subscribed Resource Test Type',
               event: 'Tested')
  end
  before(:each) do
    assign(:hook, hook).as_new_record
  end

  it 'renders new hook form' do
    render

    assert_select 'form[action=?][method=?]', hooks_path, 'post' do
      assert_select 'input#hook_subscribed_resource[name=?]', 'hook[subscribed_resource]'
      assert_select 'input#hook_event[name=?]', 'hook[event]'
    end
  end
end
