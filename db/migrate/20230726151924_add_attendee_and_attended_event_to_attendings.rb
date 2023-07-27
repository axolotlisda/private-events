class AddAttendeeAndAttendedEventToAttendings < ActiveRecord::Migration[7.0]
  def change
    add_reference :attendings, :attendee, foreign_key: { to_table: :users }
    add_reference :attendings, :attended_event, foreign_key: { to_table: :events }
  end
end
