# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { is_expected.to have_many(:attended_event) }
    it { is_expected.to have_many(:event_attendees) }
    it { is_expected.to have_many(:created_events) }
  end
end

RSpec.describe 'Siggin Up', type: :feature do
  scenario 'Sign up with valid inputs' do
    visit new_user_registration_path
    fill_in 'Email', with: 'mar@email.com'
    fill_in 'Password', with: '987654'
    fill_in 'Password confirmation', with: '987654'
    click_on 'Sign up'
    sleep(3)
    visit root_path
    expect(page).to have_content('My Events')
  end

  scenario 'Sign up with invalid inputs' do
    visit new_user_registration_path
    fill_in 'Email', with: 'maremail.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '987654'
    click_on 'Sign up'
    sleep(3)
    visit root_path
    expect(page).to_not have_content('My Events')
  end
end

RSpec.describe 'Loggin In', type: :feature do
  let(:user) { User.create(email: 'mar@email.com', password: '987654') }
  scenario 'Log in with valid inputs' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    sleep(3)
    expect(page).to have_content('My Events')
  end

  scenario 'Log in with invalid inputs' do
    visit new_user_session_path
    fill_in 'Email', with: 'maremail'
    fill_in 'Password', with: user.password
    click_on 'Log in'
    sleep(3)
    expect(page).to_not have_content('My Events')
  end
end
