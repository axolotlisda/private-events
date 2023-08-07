class RenameEventIdToEventIdInInvites < ActiveRecord::Migration[7.0]
  def change
    rename_column :invites, :Event_id, :event_id
  end
end
