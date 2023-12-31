class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.string :location
      t.boolean :private
      t.integer :creator_id

      t.timestamps
    end
    add_index :events, :creator_id
  end
end
