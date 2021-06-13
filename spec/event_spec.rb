require 'rails_helper'

RSpec.describe 'Event', type: :system do
  describe 'index page' do
    it 'shows the right content' do
      visit events_path
      expect(page).to have_content('Upcoming Events')
    end
  end
end
