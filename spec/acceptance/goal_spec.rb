require 'acceptance_helper'

feature 'Goal setting' do
  scenario 'happy path' do
    visit '/goals?id=T5JK51'
    click_link 'New Goal'
    fill_in 'Activity', with: 'Front Squat'
    fill_in 'Target', with: '100'
    click_button 'Create'

    expect(page).to have_content("Goals")
    expect(page).to have_content("Target: 100")
    expect(page).to have_content("Current:")
  end
end
