require 'spec_helper'

feature 'Viewing state of resthooks' do
  scenario 'navigating to dashboard' do
    visit '/resthook'
    expect(page).to have_content 'Resthook'
  end

  scenario 'viewing all active hooks on dashboard' do
    hook = FactoryGirl.create(:resthook_hook)
    visit '/resthook'
    expect(page).to have_selector "\#resthook_hook_#{hook.id}"
    expect(page).to have_content hook.subscribed_resource
    expect(page).to have_content hook.event
    expect(page).to have_content hook.access_token
    expect(page).to have_link 'view', href: resthook.hook_path(hook)
  end
end
