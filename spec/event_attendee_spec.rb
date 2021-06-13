# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventAttendee, type: :model do
  describe 'Associations' do
    it { should belong_to(:event_attendee).class_name('User') }
    it { should belong_to(:attended_event).class_name('Event') }
  end
end
