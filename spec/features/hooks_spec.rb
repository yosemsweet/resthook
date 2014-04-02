require 'spec_helper'

feature 'Viewing a hook' do
  let(:hook) { FactoryGirl.build(:resthook_hook) }
  background do
    hook.save!
  end
  scenario 'navigating from dashboard' do
    visit '/resthook'
    within("\#resthook_hook_#{hook.id}") do
      click_link "View"
    end
    expect(page).to have_content 'Subscribed Resource'
    expect(page).to have_content 'Event'
    expect(page).to have_content hook.subscribed_resource
    expect(page).to have_content hook.event
    expect(page).to have_content hook.url
    expect(page).to have_content hook.version
    expect(page).to have_content hook.access_token
  end
end
