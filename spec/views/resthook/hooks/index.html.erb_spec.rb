require 'spec_helper'

describe 'hooks/index' do
  let(:hook_one) do
    stub_model(Hook,
               subscribed_resource: 'Subscribed Resource Test Type',
               event: 'Tested')
  end
  let(:hook_two) do
    stub_model(Hook,
               subscribed_resource: 'Other Resource Type',
               event: 'Passed'
    )
  end
  before(:each) do
    assign(:hooks, [hook_one, hook_two])
  end

  it 'renders a list of hooks' do
    render
    expect(rendered).to contain(hook_one.subscribed_resource)
    expect(rendered).to contain(hook_two.subscribed_resource)
  end
end
