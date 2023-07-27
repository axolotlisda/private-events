class RemoveIntegerFromAttending < ActiveRecord::Migration[7.0]
  def change
    remove_column :attendings, :integer, :string
  end
end
