# rubocop:disable all

class AddEventNameToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :event_name, :text
  end
end
