require 'rails_helper'

RSpec.describe Event, :type => :model do
  context "with 2 or more events" do
    it "orders them in chronologically" do
      User.create(id: 25, email: 'mar@email.com', password: '987654')
      event1 = Event.create!(:event_date => Time.zone.now - 1, event_name: 'New Event',
      user_id: 25 )
      event2 = Event.create!(:event_date => Time.zone.now, event_name: 'New Event',
      user_id: 25)
      expect(Event.all.reload).to eq([event1, event2])
    end
  end
end

RSpec.describe Event, type: :model do
  subject do
    User.create(id: 25, email: 'mar@email.com', password: '987654')
    Event.new(
              event_name: 'New Event',
              event_date: Time.zone.now,
              user_id: 25)
  end

  it 'is valid with name, date and a creator_id(user logged in)' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.event_name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a date' do
    subject.event_date = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a creator_id logged in' do
    subject.user_id = 50
    expect(subject).to_not be_valid
  end
end
