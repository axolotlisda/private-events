class CreateAttendings < ActiveRecord::Migration[7.0]
  def change
    create_table :attendings do |t|
      t.string :attendee_id
      t.string :integer
      t.string :attended_event_id

      t.timestamps
    end
  end
end
