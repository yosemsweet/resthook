require 'spec_helper'

feature 'Viewing state of resthooks' do
  scenario 'navigating to dashboard' do
    visit '/resthook'
    expect(page).to have_content 'Resthook'
  end
end
