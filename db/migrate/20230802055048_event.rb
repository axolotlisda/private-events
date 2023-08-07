class Event < ActiveRecord::Migration[7.0]
  def change
  end
  add_foreign_key :events, :users, column: :creator_id
end
